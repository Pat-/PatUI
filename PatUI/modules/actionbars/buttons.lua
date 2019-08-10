local T, C, L = Tukui:unpack()

local ActionBars = T["ActionBars"]
local Panels = T["Panels"]

local baseCreateToggleButtons = ActionBars.CreateToggleButtons

function ActionBars:CreateToggleButtons()
    -- Call the base function first
    baseCreateToggleButtons(self)
	
	--- Then my stuff
	-- Code for SplitBar.
	local function ShowOrHideBar(bar, button)
		local db = PatUICharData
		local ActionBar1 = Panels.ActionBar1
		
		if bar:IsShown() then
			UnregisterStateDriver(bar, "visibility")
			bar:Hide()
			
			if bar == PatBar2 then
				LeftBar4:SetHeight(PatBar1:GetHeight())
				RightBar4:SetHeight(PatBar1:GetHeight())
				for i = 7, 12 do
					local buttons = _G["MultiBarRightButton"..i]
					buttons:SetAlpha(0)
				end
			end
		else
			RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
			bar:Show()
			
			if bar == PatBar2 then
				LeftBar4:SetHeight(PatBar1:GetHeight())
				RightBar4:SetHeight(PatBar1:GetHeight())
				for i = 7, 12 do
					local buttons = _G["MultiBarRightButton"..i]
					buttons:SetAlpha(1)
				end
			end
		end
	end

	local function MoveButtonBar(button, bar)
		local db = PatUICharData
		local LeftChatBG = Panels.LeftChatBG
		
		if button == B4B then
			if bar:IsShown() then
				db.hidebar4 = false
				button.text:SetText("|cff18AA18 Hide SplitBar |r")
			else
				db.hidebar4 = true
				button.text:SetText("|cff18AA18 Show SplitBar |r")
			end
		end	
		
		if button == B3B then
			if bar:IsShown() then
				db.hidebar3 = false
				button.text:SetText("|cff18AA18 - |r")
			else
				db.hidebar3 = true
				button.text:SetText("|cff18AA18 + |r")
			end
		end
		
		if button == B2B then
			if bar:IsShown() then
				db.hidebar2 = false
				button.text:SetText("|cff18AA18 - |r")
			else
				db.hidebar2 = true
				button.text:SetText("|cff18AA18 + |r")
			end
		end
		
		if button == B5B then
			if bar:IsShown() then
				db.hidebar5 = false
				button:ClearAllPoints()
				button:Point("LEFT", LeftBar, "RIGHT", 3, 0)
				button.text:SetText("|cff18AA18 < |r")
			else
				db.hidebar5 = true
				button:ClearAllPoints()
				button:Point("LEFT", LeftChatBG, "RIGHT", 3, 0)
				button.text:SetText("|cff18AA18 > |r")
			end
		end
	end


local function UpdateBar(self, bar)
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	local button = self
	
	ShowOrHideBar(bar, button)
	MoveButtonBar(button, bar)
end
	
	local LeftChatBG = Panels.LeftChatBG
	local font = "Interface\\AddOns\\PatUI\\media\\fonts\\pixelfont.ttf"
	local fontsize = 10

	local B3B = CreateFrame("Button", "B3B", UIParent)
	B3B:Size(19)
	B3B:Point("TOPRIGHT", LeftChatBG, "TOPRIGHT", -8, -8)
	B3B:SetTemplate("Transparent")
	B3B:RegisterForClicks("AnyUp")
	B3B:SetFrameLevel(6)
	B3B:SetScript("OnClick", function(self) UpdateBar(self, PatBar3) end)
	B3B.text = T.SetFontString(B3B, font, fontsize, "MONOCHROMEOUTLINE")
	B3B.text:Point("CENTER", 1, 1)
	B3B.text:SetText("|cff18AA18 - |r")

	local B4B = CreateFrame("Button", "B4B", UIParent)
	B4B:Size(PatBar1:GetWidth(), 18)
	B4B:Point("TOP", PatBar1, "BOTTOM", 0, -3)
	B4B:SetTemplate("Transparent")
	B4B:RegisterForClicks("AnyUp")
	B4B:SetFrameLevel(6)
	B4B:SetAlpha(0)
	B4B:SetFrameStrata("HIGH")
	B4B:CreateShadow()
	B4B:SetScript("OnClick", function(self) UpdateBar(self, LeftBar4) end)
	B4B:HookScript("OnClick", function(self) UpdateBar(self, RightBar4) end)
	B4B:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	B4B:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	B4B.text = T.SetFontString(B4B, font, fontsize, "MONOCHROMEOUTLINE")
	B4B.text:Point("CENTER", 0, 0)
	B4B.text:SetText("|cff18AA18 Hide SplitBar |r")

	local B2B = CreateFrame("Button", "B2B", UIParent)
	B2B:Size(PatBar1:GetWidth(), 19)
	B2B:SetPoint("BOTTOM", PatBar1, "TOP", 0, 3)
	B2B:SetTemplate("Transparent")
	B2B:RegisterForClicks("AnyUp")
	B2B:CreateShadow()
	B2B:SetAlpha(0)
	B2B:SetScript("OnClick", function(self) UpdateBar(self, PatBar2) end)
	B2B:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	B2B:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	B2B.text = T.SetFontString(B2B, font, fontsize, "MONOCHROMEOUTLINE")
	B2B.text:SetPoint("CENTER", 0, 0)
	B2B.text:SetText("|cff18AA18 - |r")

	local B5B = CreateFrame("Button", "B5B", UIParent)
	if C["PatUI"]["SmallerChat"] == true then
		B5B:Size(18, 152.5)
	else
		B5B:Size(18, 178)
	end
	B5B:Point("LEFT", LeftBar, "RIGHT", 2, 0)
	B5B:SetTemplate("Transparent")
	B5B:RegisterForClicks("AnyUp")
	B5B:SetFrameLevel(6)
	B5B:SetAlpha(0)
	B5B:SetFrameStrata("HIGH")
	B5B:CreateShadow()
	B5B:SetScript("OnClick", function(self) UpdateBar(self, LeftBar) end)
	B5B:HookScript("OnClick", function(self) UpdateBar(self, RightBar) end)
	B5B:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	B5B:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	B5B.text = T.SetFontString(B5B, font, fontsize, "MONOCHROMEOUTLINE")
	B5B.text:Point("CENTER", 0, 0)
	B5B.text:SetText("|cff18AA18 < |r")

	local init = CreateFrame("Frame")
	init:RegisterEvent("PLAYER_ENTERING_WORLD")
	init:SetScript("OnEvent", function(self, event)
		if not PatUICharData then PatUICharData = {} end
		local db = PatUICharData
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		
		if db.hidebar4 then
			UpdateBar(B4B, LeftBar4)
			UpdateBar(B4B, RightBar4)
		end
		
		if db.hidebar3 then
			UpdateBar(B3B, PatBar3)
		end
		
		if db.hidebar2 then
			UpdateBar(B2B, PatBar2)
		end
		
		if db.hidebar5 then
			UpdateBar(B5B, LeftBar)
			UpdateBar(B5B, RightBar)
		end
	end)

	for i = 2, 5 do
		local Button = T.Panels["ActionBar" .. i .. "ToggleButton"]
		Button:Hide()
	end
end
