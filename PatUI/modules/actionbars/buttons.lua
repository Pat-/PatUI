local T, C, L = Tukui:unpack()

local ActionBars = T["ActionBars"]
local Panels = T["Panels"]

local baseCreateToggleButtons = ActionBars.CreateToggleButtons

function ActionBars:CreateToggleButtons()
    -- Call the base function first
    baseCreateToggleButtons(self)
	
	--- Then my stuff
	--Code for SplitBar.
	local function ShowOrHideBar(bar, button)
		local db = PatUICharData
		local ActionBar1 = Panels.ActionBar1
		local Size = C["ActionBars"]["NormalButtonSize"]
		local Spacing = C["ActionBars"]["ButtonSpacing"]
		
		if (bar:IsVisible()) then
			UnregisterStateDriver(bar, "visibility")
			bar:Hide()
			
			if bar == PatBar3 then
				PatBar1:SetHeight((Size * 2) + (Spacing * 3))
				PatBar4:SetHeight(PatBar1:GetHeight())
				PatBar5:SetHeight(PatBar1:GetHeight())
				for i = 9, 12 do
					local buttons = _G["MultiBarRightButton"..i]
					local buttons2 = _G["MultiBarLeftButton"..i]
					buttons:SetAlpha(0)
					buttons2:SetAlpha(0)
				end
			elseif bar == PatBar2 then
				PatBar1:SetHeight((Size * 1) + (Spacing * 2))
				PatBar4:SetHeight(PatBar1:GetHeight())
				PatBar5:SetHeight(PatBar1:GetHeight())
				for i = 5, 8 do
					local buttons = _G["MultiBarRightButton"..i]
					local buttons2 = _G["MultiBarLeftButton"..i]
					buttons:SetAlpha(0)
					buttons2:SetAlpha(0)
				end
			end
		else
			RegisterStateDriver(bar, "visibility")
			bar:Show()
			
			if bar == PatBar3 then
				PatBar1:SetHeight((Size * 3) + (Spacing * 4))
				PatBar4:SetHeight(PatBar1:GetHeight())
				PatBar5:SetHeight(PatBar1:GetHeight())
				for i = 9, 12 do
					local buttons = _G["MultiBarRightButton"..i]
					local buttons2 = _G["MultiBarLeftButton"..i]
					buttons:SetAlpha(1)
					buttons2:SetAlpha(1)
				end
			elseif bar == PatBar2 then
				PatBar1:SetHeight((Size * 2) + (Spacing * 3))
				PatBar4:SetHeight(PatBar1:GetHeight())
				PatBar5:SetHeight(PatBar1:GetHeight())
				for i = 5, 8 do
					local buttons = _G["MultiBarRightButton"..i]
					local buttons2 = _G["MultiBarLeftButton"..i]
					buttons:SetAlpha(1)
					buttons2:SetAlpha(1)
				end
			end
		end
	end

	local function MoveButtonBar(button, bar)
		local db = PatUICharData
		
		if button == B4B then
			if bar:IsShown() then
				db.hidebar4 = false
				button:ClearAllPoints()
				button:Point("RIGHT", PatBar4, "LEFT", -3, 0)
				button.text:SetText("|cff18AA18 > |r")
			else
				db.hidebar4 = true
				button:ClearAllPoints()
				button:Point("RIGHT", PatBar1, "LEFT", -3, 0)
				button.text:SetText("|cff18AA18 <|r")
			end
		end	
		
		if button == B3B then
			if bar:IsShown() then
				db.hidebar3 = false
				button.text:SetText("|cff18AA18 Hide Bar 3 |r")
			else
				db.hidebar3 = true
				button.text:SetText("|cff18AA18 Show Bar 3 |r")
			end
		end
		
		if button == B2B then
			if bar:IsShown() then
				db.hidebar2 = false
				button.text:SetText("|cff18AA18 Hide Bar 2 |r")
			else
				db.hidebar2 = true
				button.text:SetText("|cff18AA18 Show Bar 2 |r")
			end
		end
		
		if button == B5B then
			if bar:IsShown() then
				db.hidebar5 = false
				button:ClearAllPoints()
				button:Point("LEFT", PatBar5, "RIGHT", 3, 0)
				button.text:SetText("|cff18AA18 < |r")
			else
				db.hidebar5 = true
				button:ClearAllPoints()
				button:Point("LEFT", PatBar1, "RIGHT", 3, 0)
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
	B3B:Point("BOTTOM", PatBar1, "TOP", 0, 3)
	B3B:Size(PatBar1:GetWidth(), 19)
	if C["PatUI"]["ThickBorders"] == true then
		B3B:PatUI("Transparent")
	else
		B3B:SetTemplate("Transparent")
	end
	B3B:RegisterForClicks("AnyUp")
	B3B:SetAlpha(0)
	B3B:CreateShadow()
	B3B:SetScript("OnClick", function(self) UpdateBar(self, PatBar3) end)
	B3B:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	B3B:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	B3B.text = T.SetFontString(B3B, font, fontsize, "MONOCHROMEOUTLINE")
	B3B.text:Point("CENTER", 1, 1)
	B3B.text:SetText("|cff18AA18 Hide Bar 3 |r")

	local B4B = CreateFrame("Button", "B4B", UIParent)
	B4B:Size(19, PatBar1:GetHeight())
	B4B:Point("RIGHT", PatBar4, "LEFT", -3, 0)
	if C["PatUI"]["ThickBorders"] == true then
		B4B:PatUI("Transparent")
	else
		B4B:SetTemplate("Transparent")
	end
	B4B:RegisterForClicks("AnyUp")
	B4B:SetAlpha(0)
	B4B:CreateShadow()
	B4B:SetScript("OnClick", function(self) UpdateBar(self, PatBar4) end)
	B4B:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	B4B:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	B4B.text = T.SetFontString(B4B, font, fontsize, "MONOCHROMEOUTLINE")
	B4B.text:Point("CENTER", 0, 0)
	B4B.text:SetText("|cff18AA18 > |r")

	local B2B = CreateFrame("Button", "B2B", UIParent)
	B2B:Size(PatBar1:GetWidth(), 19)
	B2B:SetPoint("TOP", PatBar1, "BOTTOM", 0, -3)
	if C["PatUI"]["ThickBorders"] == true then
		B2B:PatUI("Transparent")
	else
		B2B:SetTemplate("Transparent")
	end
	B2B:RegisterForClicks("AnyUp")
	B2B:CreateShadow()
	B2B:SetAlpha(0)
	B2B:SetScript("OnClick", function(self) UpdateBar(self, PatBar2) end)
	B2B:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	B2B:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	B2B.text = T.SetFontString(B2B, font, fontsize, "MONOCHROMEOUTLINE")
	B2B.text:SetPoint("CENTER", 0, 0)
	B2B.text:SetText("|cff18AA18 Hide Bar 2 |r")

	local B5B = CreateFrame("Button", "B5B", UIParent)	
	B5B:Size(19, PatBar1:GetHeight())
	B5B:Point("LEFT", PatBar5, "RIGHT", 3, 0)
	if C["PatUI"]["ThickBorders"] == true then
		B5B:PatUI("Transparent")
	else
		B5B:SetTemplate("Transparent")
	end
	B5B:RegisterForClicks("AnyUp")
	B5B:SetAlpha(0)
	B5B:CreateShadow()
	B5B:SetScript("OnClick", function(self) UpdateBar(self, PatBar5) end)
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
		
		local Size = C["ActionBars"]["NormalButtonSize"]
		local Spacing = C["ActionBars"]["ButtonSpacing"]
		
		if db.hidebar2 then
			UpdateBar(B2B, PatBar2)
		end
		
		if db.hidebar3 then
			UpdateBar(B3B, PatBar3)
		end
		
		if db.hidebar4 then
			UpdateBar(B4B, PatBar4)
		end
		
		if db.hidebar5 then
			UpdateBar(B5B, PatBar5)
		end
		
		if db.hidebar3 and db.hidebar2 then
			PatBar1:SetHeight((Size * 1) + (Spacing * 2))
			PatBar5:Height(PatBar1:GetHeight())
			PatBar4:Height(PatBar1:GetHeight())
		end
	end)

	for i = 2, 5 do
		local Button = T.Panels["ActionBar" .. i .. "ToggleButton"]
		Button:Kill()
	end
end
