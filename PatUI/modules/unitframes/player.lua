local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames
local Noop = function() end
local Class = select(2, UnitClass("player"))

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
	Health:SetInside(self)
	
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
	Castbar:SetSize((PatBar1:GetWidth()), 19)
	Castbar:SetPoint("BOTTOMRIGHT", PatBar1, "TOPRIGHT", 0, 3)
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
	AdditionalPower:SetPoint("BOTTOM", Health, "TOP", 0, 4)
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
		ComboPointsBar:CreateBackdrop("Transparent")
		
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