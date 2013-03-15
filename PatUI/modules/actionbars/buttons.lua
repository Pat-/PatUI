local P, C, L, G = unpack(Tukui)

-- Code for Bar2.
local function ShowOrHideBar(bar, button)
	local db = TukuiDataPerChar
	
	if bar:IsShown() then
		UnregisterStateDriver(bar, "visibility")
		bar:Hide()
		
		-- for bar 2½+3½+4, high reso only
		if bar == Bar4 then
			TukuiBar2:SetHeight(TukuiBar1:GetHeight())
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
		
		-- for bar 2½+3½+4, high reso only
		if bar == Bar4 then
			TukuiBar2:SetHeight(Bar4:GetHeight())
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
	
	if button == SplitButton then
		if bar:IsShown() then
			db.hidebar2 = false
			button:ClearAllPoints()
			button:Point("RIGHT", ChatBarButton, "LEFT", -3, 0)
			button.text:SetText("|cff18AA18 - |r")
		else
			db.hidebar2 = true
			button:ClearAllPoints()
			button:Point("RIGHT", ChatBarButton, "LEFT", -3, 0)
			button.text:SetText("|cff18AA18 + |r")
		end
	end	
	
	if button == ChatBarButton then
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

local ChatBarButton = CreateFrame("Button", "ChatBarButton", TukuiPetBattleHider)
ChatBarButton:Size(19)
ChatBarButton:Point("RIGHT", TukuiTabsLeftBackground, "RIGHT", -2, 0)
ChatBarButton:PatSkin()
ChatBarButton:RegisterForClicks("AnyUp")
ChatBarButton:SetFrameLevel(6)
ChatBarButton:SetFrameStrata("HIGH")
ChatBarButton:SetScript("OnClick", function(self) UpdateBar(self, Bar3) end)
ChatBarButton.text = P.SetFontString(ChatBarButton, C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
ChatBarButton.text:Point("CENTER", 0, 0)
ChatBarButton.text:SetText("|cff18AA18 + |r")

local SplitButton = CreateFrame("Button", "SplitButton", TukuiPetBattleHider)
SplitButton:Size(19)
SplitButton:Point("RIGHT", ChatBarButton, "LEFT", -3, 0)
SplitButton:PatSkin()
SplitButton:RegisterForClicks("AnyUp")
SplitButton:SetFrameLevel(6)
SplitButton:SetFrameStrata("HIGH")
SplitButton:SetScript("OnClick", function(self) UpdateBar(self, TukuiBar2) end)
SplitButton.text = P.SetFontString(SplitButton, C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
SplitButton.text:Point("CENTER", 0, 0)
SplitButton.text:SetText("|cff18AA18 + |r")

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
		UpdateBar(SplitButton, TukuiBar2)
	end
	
	if not P.lowversion and db.hidebar3 then
		UpdateBar(ChatBarButton, Bar3)
	end
	
	if db.hidebar4 then
		UpdateBar(Bar4Button, Bar4)
	end
end)