local P, C, L, G = unpack(Tukui)

-- Code for SplitBar.
local function ShowOrHideBar(bar, button)
	local db = PatUICharData
	
	if bar:IsShown() then
		UnregisterStateDriver(bar, "visibility")
		bar:Hide()
		
		if bar == Bar4 then
			LeftBar2:SetHeight(TukuiBar1:GetHeight())
			RightBar2:SetHeight(TukuiBar1:GetHeight())
			if not P.lowversion then
				for i = 7, 12 do
					local left = _G["MultiBarBottomLeftButton"..i]
					left:SetAlpha(0)
				end
			end
		end
	else
		RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
		bar:Show()
		
		if bar == Bar4 then
			LeftBar2:SetHeight(TukuiBar1:GetHeight())
			RightBar2:SetHeight(TukuiBar1:GetHeight())
			if not P.lowversion then
				for i = 7, 12 do
					local left = _G["MultiBarBottomLeftButton"..i]
					left:SetAlpha(1)
				end
			end
		end
	end
end

local function MoveButtonBar(button, bar)
	local db = PatUICharData
	
	if button == Bar2Button then
		if bar:IsShown() then
			db.hidebar2 = false
			button.text:SetText("|cff18AA18 Hide SplitBar |r")
		else
			db.hidebar2 = true
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
	
	if button == Bar4Button then
		if bar:IsShown() then
			db.hidebar4 = false
			button.text:SetText("|cff18AA18 - |r")
		else
			db.hidebar4 = true
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
			button:Point("LEFT", TukuiChatBackgroundLeft, "RIGHT", 3, 13)
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

local Bar3Button = CreateFrame("Button", "Bar3Button", TukuiPetBattleHider)
Bar3Button:Size(19)
Bar3Button:Point("RIGHT", TukuiTabsLeftBackground, "RIGHT", -2, 0)
Bar3Button:PatSkin()
Bar3Button:SkinButton()
Bar3Button:RegisterForClicks("AnyUp")
Bar3Button:SetFrameLevel(6)
Bar3Button:SetFrameStrata("HIGH")
Bar3Button:SetScript("OnClick", function(self) UpdateBar(self, Bar3) end)
Bar3Button.text = P.SetFontString(Bar3Button, C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
Bar3Button.text:Point("CENTER", 1, 1)
Bar3Button.text:SetText("|cff18AA18 - |r")

local Bar2Button = CreateFrame("Button", "Bar2Button", TukuiPetBattleHider)
Bar2Button:Size(TukuiBar1:GetWidth(), 18)
Bar2Button:Point("TOP", TukuiBar1, "BOTTOM", 0, -3)
Bar2Button:PatSkin()
Bar2Button:RegisterForClicks("AnyUp")
Bar2Button:SetFrameLevel(6)
Bar2Button:SetAlpha(0)
Bar2Button:SetFrameStrata("HIGH")
Bar2Button:SetScript("OnClick", function(self) UpdateBar(self, LeftBar2) end)
Bar2Button:HookScript("OnClick", function(self) UpdateBar(self, RightBar2) end)
Bar2Button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
Bar2Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
Bar2Button.text = P.SetFontString(Bar2Button, C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
Bar2Button.text:Point("CENTER", 0, 0)
Bar2Button.text:SetText("|cff18AA18 Hide SplitBar |r")

local Bar4Button = CreateFrame("Button", "Bar4Button", TukuiPetBattleHider)
Bar4Button:Size(TukuiBar1:GetWidth(), 19)
Bar4Button:SetPoint("BOTTOM", TukuiBar1, "TOP", 0, 3)
Bar4Button:PatSkin()
Bar4Button:RegisterForClicks("AnyUp")
Bar4Button:SetAlpha(0)
Bar4Button:SetScript("OnClick", function(self) UpdateBar(self, Bar4) end)
Bar4Button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
Bar4Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
Bar4Button.text = P.SetFontString(Bar4Button, C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
Bar4Button.text:SetPoint("CENTER", 0, 0)
Bar4Button.text:SetText("|cff18AA18 - |r")

local Bar5Button = CreateFrame("Button", "Bar5Button", TukuiPetBattleHider)
Bar5Button:Size(18, LeftBar:GetHeight())
Bar5Button:Point("LEFT", LeftBar, "RIGHT", 3, 0)
Bar5Button:PatSkin()
Bar5Button:RegisterForClicks("AnyUp")
Bar5Button:SetFrameLevel(6)
Bar5Button:SetAlpha(0)
Bar5Button:SetFrameStrata("HIGH")
Bar5Button:SetScript("OnClick", function(self) UpdateBar(self, LeftBar) end)
Bar5Button:HookScript("OnClick", function(self) UpdateBar(self, RightBar) end)
Bar5Button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
Bar5Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
Bar5Button.text = P.SetFontString(Bar5Button, C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
Bar5Button.text:Point("CENTER", 0, 0)
Bar5Button.text:SetText("|cff18AA18 < |r")

TukuiExitVehicleButtonRight:Size(19)
TukuiExitVehicleButtonRight:PatSkin()
TukuiExitVehicleButtonRight:ClearAllPoints()
TukuiExitVehicleButtonRight:Point("RIGHT", Bar3Button, "LEFT", -3, 0)
TukuiExitVehicleButtonRight:SetFrameLevel(20)
TukuiExitVehicleButtonRight.text:SetText("|cff4BAF4C V|r")
TukuiExitVehicleButtonRight:SetBackdropBorderColor(unpack(C.general.bordercolor))

local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	if not PatUICharData then PatUICharData = {} end
	local db = PatUICharData
	
	if not P.lowversion and db.hidebar2 then
		UpdateBar(Bar2Button, LeftBar2)
		UpdateBar(Bar2Button, RightBar2)
	end
	
	if not P.lowversion and db.hidebar3 then
		UpdateBar(Bar3Button, Bar3)
	end
	
	if db.hidebar4 then
		UpdateBar(Bar4Button, Bar4)
	end
	
	if db.hidebar5 then
		UpdateBar(Bar5Button, LeftBar)
		UpdateBar(Bar5Button, RightBar)
	end
end)

TukuiBar2Button:Hide()
TukuiBar3Button:Hide()
