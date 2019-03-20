local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames
local Noop = function() end
local Class = select(2, UnitClass("player"))

--[[local self = _G["TukuiPlayer"]
local font = C.media.pixelfont
local fsize = C.media.pfontsize

self.panel:Kill()
self.shadow:Kill()
self.FlashInfo:Kill()

self:SetBackdrop(nil)
self:SetBackdropColor(0, 0, 0)

------------------------------------------------------------------------
-- Setup Player Frames
------------------------------------------------------------------------

self:Size(240, 26)

self.Health:SetHeight(23)
self.Health:SetFrameLevel(5)
self.Health:CreateBorder()

self.Health.bg:SetTexture(C.media.normTex)
self.Health.bg:SetVertexColor(.6, .2, .2)

self.Health.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Health.value:Point("LEFT", self.Health, "LEFT", 4, 0)
self.Health.value:SetShadowOffset(0, 0)

self.Power:ClearAllPoints()
self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", -4, 1)
self.Power:SetHeight(3)
self.Power:SetWidth(90)
self.Power:SetFrameLevel(10)
self.Power:CreateBorder()

self.Power.bg:SetVertexColor(.12, .12, .12)
self.Power.bg:SetTexture(C.media.normTex)

self.Power.colorClass = false
self.Power.colorReaction = false

self.Power.value = P.SetFontString( self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Power.value:Point("RIGHT", self.Health, "RIGHT", -4, 0)
self.Power.value:SetShadowOffset(0, 0)

self.Castbar:ClearAllPoints()
self.Castbar:SetSize((TukuiBar1:GetWidth() - 4), 19)
self.Castbar:SetPoint("BOTTOMRIGHT", TukuiBar1, "TOPRIGHT", -2, 5)
self.Castbar:CreateBackdrop("Transparent")
self.Castbar.bg:Kill()
self.Castbar:ThickBorder()

self.Castbar.Time = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 1)

self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 1)

self.Combat:ClearAllPoints()
self.Combat:Point("CENTER", self.Health, "CENTER", 0, 0)

-- experience bar on player via mouseover for player currently leveling a character
if P.level ~= MAX_PLAYER_LEVEL then
   	self.Experience:ClearAllPoints()
	self.Experience:SetStatusBarColor( 0, 0.4, 1, 0.8 )

	self.Experience:Size(TukuiTabsLeftBackground:GetWidth() - 4, 2)
	self.Experience:Point("BOTTOM", TukuiTabsLeftBackground, "TOP", 0, 5)
	self.Experience:SetFrameLevel(3)
	self.Experience:SetAlpha(1)
	self.Experience:CreateBorder()

	self.Experience:SetBackdropColor(.12, .12, .12, .9)

	self.Experience:HookScript("OnLeave", function(self) self:SetAlpha(1) end)

	self.Resting:SetTexture(nil)
end

-- reputation bar for max level character
if P.level == MAX_PLAYER_LEVEL then
   self.Reputation:ClearAllPoints()

	self.Reputation:Size(TukuiTabsLeftBackground:GetWidth() - 4, 2)
	self.Reputation:Point("BOTTOM", TukuiTabsLeftBackground, "TOP", 0, 5)
	self.Reputation:SetFrameLevel(3)
	self.Reputation:SetAlpha(1)
	self.Reputation:CreateBorder()

	self.Reputation:SetBackdropColor(.12, .12, .12, .9)

	self.Reputation:SetScript("OnLeave", function(self) self:SetAlpha(1) end)
end
]]--

local function CreateUnits()
    local Player = UnitFrames.Units.Player

	Player:SetHeight(23)
	Player:SetWidth(240)
	
	Player:ClearAllPoints()
	Player:SetPoint("BOTTOMLEFT", PatBar1, "TOPLEFT", -160, 50)
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

local function Player(self)
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local AdditionalPower = self.AdditionalPower
	local Castbar = self.Castbar
	local Portrait = self.Portrait
	local CombatFeedbackText = self.CombatFeedbackText
	local RaidIcon = self.RaidTargetIndicator
	local Combat = self.CombatIndicator 
	local MasterLooter = self.MasterLooterIndicator 
	local Leader = self.LeaderIndicator 
	local TotemBar = self.Totems
	ComboPointsBar = self.ComboPointsBar
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local PowerPrediction = self.PowerPrediction.mainBar
	local AdditionalPowerPrediction = self.PowerPrediction.altBar
	
	Panel:Hide()
	
	Health:SetHeight(23)
	
	Health.Value:ClearAllPoints()
	Health.Value:Point("LEFT", Health, "LEFT", 4, 0)
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:SetColorTexture(.1, .1, .1)
	
	Health.colorClass = false
	Health.colorReaction = false
	
	Power:ClearAllPoints()
	Power:Point("TOPRIGHT", Health, "BOTTOMRIGHT", -4, 1)
	Power:SetHeight(3)
	Power:SetWidth(90)
	Power:SetFrameLevel(10)
	Power:CreateBackdrop("Default")
	Power:CreateShadow()
	
	Power.Value:ClearAllPoints()
	Power.Value:Point("RIGHT", Health, "RIGHT", -4, 0)
	Power.Value:SetShadowOffset(0, 0)

	Castbar:ClearAllPoints()
	Castbar:SetSize((PatBar1:GetWidth() - 4), 19)
	Castbar:SetPoint("BOTTOMRIGHT", PatBar1, "TOPRIGHT", -2, 5)
	Castbar:CreateBackdrop("Transparent")
	Castbar.Background:Hide()
	
	Castbar.Time:ClearAllPoints()
	Castbar.Time:Point("RIGHT", Castbar, "RIGHT", -4, 1)

	Castbar.Text:ClearAllPoints()
	Castbar.Text:Point("LEFT", Castbar, "LEFT", 4, 1)
	
	Combat:ClearAllPoints()
	Combat:Point("CENTER", Health, "CENTER", 0, 0)
	
	CombatFeedbackText:ClearAllPoints()
	
	AdditionalPower:ClearAllPoints()
	AdditionalPower:SetPoint("BOTTOM", Health, "TOP", 0, 3)
	AdditionalPower:SetFrameLevel(3)
	AdditionalPower:CreateShadow()
	AdditionalPower:SetFrameStrata("BACKGROUND")
	AdditionalPower:Width(240)
	AdditionalPower:Height(5)
	
	if (Class == "ROGUE" or Class == "DRUID") then
		
		ComboPointsBar:ClearAllPoints()
		ComboPointsBar:Size(240, 5)
		ComboPointsBar:SetFrameLevel(15)
		ComboPointsBar:SetAlpha(1)
		ComboPointsBar:SetBackdrop(nil)
		ComboPointsBar:CreateBackdrop("Default")
		
		ComboPointsBar:SetPoint("BOTTOM", Health, "TOP", 0, 3)
		
		for i = 1, 6 do
		ComboPointsBar[i]:ClearAllPoints()
		ComboPointsBar[i]:CreateBackdrop()
		ComboPointsBar[i]:Height(5)

			if i == 1 then
				ComboPointsBar[i]:Point("LEFT", ComboPointsBar, "LEFT", 0, 0)
				ComboPointsBar[i]:SetWidth(32)
				ComboPointsBar[i].BarSizeForMaxComboIs6 = 40
				ComboPointsBar[i].BarSizeForMaxComboIs5 = 48
			else
				ComboPointsBar[i]:Point("LEFT", ComboPointsBar[i-1], "RIGHT", 1, 0)
				ComboPointsBar[i]:SetWidth(32)
				ComboPointsBar[i].BarSizeForMaxComboIs6 = 39
				ComboPointsBar[i].BarSizeForMaxComboIs5 = 47
			end
		end
	end
	
end
hooksecurefunc(UnitFrames, "Player", Player)