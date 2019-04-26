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
		
		if button == Bar4Button then
			if bar:IsShown() then
				db.hidebar4 = false
				button.text:SetText("|cff18AA18 Hide SplitBar |r")
			else
				db.hidebar4 = true
				button.text:SetText("|cff18AA18 Show SplitBar |r")
			end
		end	
		
		if button == Bar3Button then
			if bar:IsShown() then
				db.hidebar3 = false
				button.text:SetText("|cff18AA18 - |r")
			else
				db.hidebar3 = true
				button.text:SetText("|cff18AA18 + |r")
			end
		end
		
		if button == Bar2Button then
			if bar:IsShown() then
				db.hidebar2 = false
				button.text:SetText("|cff18AA18 - |r")
			else
				db.hidebar2 = true
				button.text:SetText("|cff18AA18 + |r")
			end
		end
		
		if button == Bar5Button then
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
	local font = [=[Interface\AddOns\Tukui\Medias\Fonts\pixel_font.ttf]=]
	local fontsize = 12

	local Bar3Button = CreateFrame("Button", "Bar3Button", UIParent)
	Bar3Button:Size(19)
	Bar3Button:Point("TOPRIGHT", LeftChatBG, "TOPRIGHT", -8, -8)
	Bar3Button:SetTemplate("Transparent")
	Bar3Button:RegisterForClicks("AnyUp")
	Bar3Button:SetFrameLevel(6)
	--Bar3Button:SetFrameStrata("HIGH") (conflicts with world map)
	Bar3Button:SetScript("OnClick", function(self) UpdateBar(self, PatBar3) end)
	Bar3Button.text = T.SetFontString(Bar3Button, font, fontsize, "MONOCHROMEOUTLINE")
	Bar3Button.text:Point("CENTER", 1, 1)
	Bar3Button.text:SetText("|cff18AA18 - |r")

	local Bar4Button = CreateFrame("Button", "Bar4Button", UIParent)
	Bar4Button:Size(PatBar1:GetWidth(), 18)
	Bar4Button:Point("TOP", PatBar1, "BOTTOM", 0, -3)
	Bar4Button:SetTemplate("Transparent")
	Bar4Button:RegisterForClicks("AnyUp")
	Bar4Button:SetFrameLevel(6)
	Bar4Button:SetAlpha(0)
	Bar4Button:SetFrameStrata("HIGH")
	Bar4Button:CreateShadow()
	Bar4Button:SetScript("OnClick", function(self) UpdateBar(self, LeftBar4) end)
	Bar4Button:HookScript("OnClick", function(self) UpdateBar(self, RightBar4) end)
	Bar4Button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	Bar4Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	Bar4Button.text = T.SetFontString(Bar4Button, font, fontsize, "MONOCHROMEOUTLINE")
	Bar4Button.text:Point("CENTER", 0, 0)
	Bar4Button.text:SetText("|cff18AA18 Hide SplitBar |r")

	local Bar2Button = CreateFrame("Button", "Bar2Button", UIParent)
	Bar2Button:Size(PatBar1:GetWidth(), 19)
	Bar2Button:SetPoint("BOTTOM", PatBar1, "TOP", 0, 3)
	Bar2Button:SetTemplate("Transparent")
	Bar2Button:RegisterForClicks("AnyUp")
	Bar2Button:CreateShadow()
	Bar2Button:SetAlpha(0)
	Bar2Button:SetScript("OnClick", function(self) UpdateBar(self, PatBar2) end)
	Bar2Button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	Bar2Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	Bar2Button.text = T.SetFontString(Bar2Button, font, fontsize, "MONOCHROMEOUTLINE")
	Bar2Button.text:SetPoint("CENTER", 0, 0)
	Bar2Button.text:SetText("|cff18AA18 - |r")

	local Bar5Button = CreateFrame("Button", "Bar5Button", UIParent)
	if C["General"]["SmallerChat"] == true then
		Bar5Button:Size(18, 152.5)
	else
		Bar5Button:Size(18, 178)
	end
	Bar5Button:Point("LEFT", LeftBar, "RIGHT", 2, 0)
	Bar5Button:SetTemplate("Transparent")
	Bar5Button:RegisterForClicks("AnyUp")
	Bar5Button:SetFrameLevel(6)
	Bar5Button:SetAlpha(0)
	Bar5Button:SetFrameStrata("HIGH")
	Bar5Button:CreateShadow()
	Bar5Button:SetScript("OnClick", function(self) UpdateBar(self, LeftBar) end)
	Bar5Button:HookScript("OnClick", function(self) UpdateBar(self, RightBar) end)
	Bar5Button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	Bar5Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	Bar5Button.text = T.SetFontString(Bar5Button, font, fontsize, "MONOCHROMEOUTLINE")
	Bar5Button.text:Point("CENTER", 0, 0)
	Bar5Button.text:SetText("|cff18AA18 < |r")

	local init = CreateFrame("Frame")
	init:RegisterEvent("PLAYER_ENTERING_WORLD")
	init:SetScript("OnEvent", function(self, event)
		if not PatUICharData then PatUICharData = {} end
		local db = PatUICharData
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		
		if db.hidebar4 then
			UpdateBar(Bar4Button, LeftBar4)
			UpdateBar(Bar4Button, RightBar4)
		end
		
		if db.hidebar3 then
			UpdateBar(Bar3Button, PatBar3)
		end
		
		if db.hidebar2 then
			UpdateBar(Bar2Button, PatBar2)
		end
		
		if db.hidebar5 then
			UpdateBar(Bar5Button, LeftBar)
			UpdateBar(Bar5Button, RightBar)
		end
	end)

	for i = 2, 5 do
		local Button = T.Panels["ActionBar" .. i .. "ToggleButton"]
		Button:Hide()
	end
end
