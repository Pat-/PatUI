local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames
local Noop = function() end

local function CreateUnits()
    local Target = UnitFrames.Units.Target

	Target:SetHeight(23)
	Target:SetWidth(240)
	
	Target.Shadow:Kill()
	
	Target:ClearAllPoints()
	Target:SetPoint("BOTTOMRIGHT", PatBar1, "TOPRIGHT", 160, 50)
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

local function Target(self)
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Name = self.Name
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Portrait = self.Portrait
	local CombatFeedbackText = self.CombatFeedbackText
	local ComboPointsBar = self.ComboPointsBar
	local AltPower = self.AlternativePower
	local RaidIcon = self.RaidTargetIndicator
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	
	Panel:Hide()
	Panel:ClearAllPoints()
	Panel:Point("LEFT", Health, "LEFT", 4, 0)
	
	CombatFeedbackText:ClearAllPoints()
	
	Health:SetHeight(23)
	Health:CreateShadow()
	
	Health.Value:ClearAllPoints()
	Health.Value:Point("RIGHT", Health, "RIGHT", -4, 0)
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:SetColorTexture(.1, .1, .1)
	
	Health.colorClass = false
	Health.colorReaction = false
    Health.colorTapping = false
    Health.colorDisconnected = false

	Power:ClearAllPoints()
	Power:Point("TOPLEFT", Health, "BOTTOMLEFT", 4, 1)
	Power:SetHeight(3)
	Power:SetWidth(90)
	Power:SetFrameLevel(10)
	Power:CreateBackdrop("Default")
	Power:CreateShadow()
	Power.Background:Hide()
	
	Power.Value:ClearAllPoints()
	Power.Value:Point("LEFT", Health, "LEFT", 4, 0)
	Power.Value:SetShadowOffset(0, 0)
	
	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:Point("LEFT", Health, "LEFT", 4, 0)
	self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level]|r [shortclassification]")

	Castbar:SetSize(280, 12)
	Castbar:ClearAllPoints()
	Castbar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 400)
	Castbar:CreateBackdrop("Transparent")
	Castbar.Background:Hide()
	
	Castbar.Time:ClearAllPoints()
	Castbar.Time:Point("RIGHT", Castbar, "RIGHT", -4, 1)

	Castbar.Text:ClearAllPoints()
	Castbar.Text:Point("LEFT", Castbar, "LEFT", 4, 1)
	Castbar.Text:Size(130, 10) -- prevent long cast names (ex: Bloodbathed Frostbrood Vanquisher) from wrapping and going outside of the castbar
	
	AltPower:ClearAllPoints()
	
	if (C["UnitFrames"]["TargetAuras"]) then
		Buffs:SetHeight(27)
		Buffs:SetWidth(260)
		Buffs.size = 24
		Buffs.num = 9
		Buffs.spacing = 1
		Buffs.initialAnchor = 'TOPLEFT'
		Buffs["growth-y"] = "UP"
		Buffs["growth-x"] = "RIGHT"
		Buffs:ClearAllPoints()
		Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -1, 1)
		Buffs:SetParent(Health)
		Buffs.PostUpdate = UnitFrames.UpdateBuffsHeaderPosition
		
		Debuffs:SetHeight(29)
		Debuffs:SetWidth(240)
		Debuffs.size = 27
		Debuffs.num = 21
		Debuffs.spacing = 1
		Debuffs.initialAnchor = 'TOPRIGHT'
		Debuffs["growth-y"] = "UP"
		Debuffs["growth-x"] = "LEFT"
		Debuffs:ClearAllPoints()
		Debuffs:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", 0, 35)
		Debuffs:SetParent(Health)
		
		Buffs.ClearAllPoints = T.dummy
		Debuffs.ClearAllPoints = T.dummy
	end
end
hooksecurefunc(UnitFrames, "Target", Target)