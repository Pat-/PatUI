local P, C, L, G = unpack(Tukui)

-- Code for Bar2.
local function ShowOrHideBar(bar, button)
	local db = TukuiDataPerChar
	
	if bar:IsShown() then
		UnregisterStateDriver(bar, "visibility")
		bar:Hide()
		
		if bar == Bar4 then
			TukuiBar2:SetHeight(TukuiBar1:GetHeight())
			SplitBarRight:SetHeight(TukuiBar1:GetHeight())
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
			TukuiBar2:SetHeight(TukuiBar1:GetHeight())
			SplitBarRight:SetHeight(TukuiBar1:GetHeight())
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
	local db = TukuiDataPerChar
	
	if button == SplitBarButton then
		if bar:IsShown() then
			db.hidebar2 = false
			button:ClearAllPoints()
			button:Point("TOP", TukuiBar1, "BOTTOM", 0, -3)
			button.text:SetText("|cff18AA18 Hide Splitbar |r")
		else
			db.hidebar2 = true
			button:ClearAllPoints()
			button:Point("TOP", TukuiBar1, "BOTTOM", 0, -3)
			button.text:SetText("|cff18AA18 Show Splitbar |r")
		end
	end	
	
	if button == Bar3Button then
		if bar:IsShown() then
			db.hidebar3 = false
			button:ClearAllPoints()
			button:Point("RIGHT", TukuiTabsLeftBackground, "RIGHT", -2, 0)
			button.text:SetText("|cff18AA18 - |r")
		else
			db.hidebar3 = true
			button:ClearAllPoints()
			button:Point("RIGHT", TukuiTabsLeftBackground, "RIGHT", -2, 0)
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
end


local function UpdateBar(self, bar)
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	local button = self
	
	ShowOrHideBar(bar, button)
	MoveButtonBar(button, bar)
end

TukuiBar2Button:Hide()
TukuiBar3Button:Hide()

local Bar3Button = CreateFrame("Button", "Bar3Button", TukuiPetBattleHider)
Bar3Button:Size(19)
Bar3Button:Point("RIGHT", TukuiTabsLeftBackground, "RIGHT", -2, 0)
Bar3Button:PatSkin()
Bar3Button:RegisterForClicks("AnyUp")
Bar3Button:SetFrameLevel(6)
Bar3Button:SetFrameStrata("HIGH")
Bar3Button:SetScript("OnClick", function(self) UpdateBar(self, Bar3) end)
Bar3Button.text = P.SetFontString(Bar3Button, C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
Bar3Button.text:Point("CENTER", 0, 0)
Bar3Button.text:SetText("|cff18AA18 - |r")

local SplitBarButton = CreateFrame("Button", "SplitBarButton", TukuiPetBattleHider)
SplitBarButton:Size((TukuiBar1:GetWidth() / 3) - 1, 18)
SplitBarButton:Point("TOP", TukuiBar1, "BOTTOM", 0, -3)
SplitBarButton:SetTemplate('Default')
SplitBarButton:RegisterForClicks("AnyUp")
SplitBarButton:SetFrameLevel(6)
SplitBarButton:SetAlpha(0)
SplitBarButton:SetFrameStrata("HIGH")
SplitBarButton:SetScript("OnClick", function(self) UpdateBar(self, TukuiBar2) end)
SplitBarButton:HookScript("OnClick", function(self) UpdateBar(self, SplitBarRight) end)
SplitBarButton:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
SplitBarButton:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
SplitBarButton.text = P.SetFontString(SplitBarButton, C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
SplitBarButton.text:Point("CENTER", 0, 0)
SplitBarButton.text:SetText("|cff18AA18 Hide SplitBars |r")

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

local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	if not TukuiDataPerChar then TukuiDataPerChar = {} end
	local db = TukuiDataPerChar
	
	if not P.lowversion and db.hidebar2 then
		UpdateBar(TukuiBar2Button, TukuiBar2) -- need this for splitbar to hide on rl/login, no idea why :S
		UpdateBar(SplitBarButton, TukuiBar2)
		UpdateBar(SplitBarButton, SplitBarRight)
	end
	
	if not P.lowversion and db.hidebar3 then
		UpdateBar(Bar3Button, Bar3)
	end
	
	if db.hidebar4 then
		UpdateBar(Bar4Button, Bar4)
	end
end)

TukuiExitVehicleButtonRight:Size(19)
TukuiExitVehicleButtonRight:PatSkin()
TukuiExitVehicleButtonRight:ClearAllPoints()
TukuiExitVehicleButtonRight:Point("RIGHT", Bar3Button, "LEFT", -3, 0)
TukuiExitVehicleButtonRight:SetFrameLevel(20)
TukuiExitVehicleButtonRight.text:SetText("|cff4BAF4C V|r")
TukuiExitVehicleButtonRight:SetBackdropBorderColor(unpack(C.general.bordercolor))



