local T, C, L = Tukui:unpack()

local UnitFrames = T.UnitFrames

local baseBoss = UnitFrames.Boss

function UnitFrames:Boss()
	-- Call the base function first
	baseBoss(self)
	
	-- Then my stuff
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local AltPower = self.AlternativePower
	local Name = self.Name
	local RaidIcon = self.RaidTargetIndicator
	
	----------------------------------------------------
	----- Health
	----------------------------------------------------

	Health:ClearAllPoints()
	Health:SetInside(self, -0.5, -0.5)

	Health:PatUI()
	Health.Backdrop:SetBackdropBorderColor(0, 0, 0)
	Health.Backdrop:SetOutside()
	Health.Backdrop:SetFrameStrata("BACKGROUND")

	Health:CreateThinShadow()
	Health.Shadow:SetOutside(Health.Backdrop, 6, 6)
	
	Health:SetStatusBarColor(.21, .2, .18)
	Health.Background:SetColorTexture(.38, .40, .40)

	Health.Value:ClearAllPoints()
	Health.Value:SetPoint("RIGHT", Health, "RIGHT", -4, 1)
	
	Health.colorClass = false
	Health.colorReaction = false

	----------------------------------------------------
	----- Power
	----------------------------------------------------
	
	Power:SetSize(129, 2)
	Power:ClearAllPoints()
	Power:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 8, -4)
	Power:SetFrameLevel(Health:GetFrameLevel())
	Power:SetFrameStrata("MEDIUM")

	Power:PatUI()
	Power.Backdrop:SetBackdropBorderColor(0, 0, 0)
	Power.Backdrop:SetOutside()
	Power.Backdrop:SetFrameStrata("BACKGROUND")

	Power:CreateThinShadow()
	Power.Shadow:SetOutside(Power.Backdrop, 6, 6)

	Power.Background.multiplier = 0.6

	----------------------------------------------------
	----- Castbar
	----------------------------------------------------
	
	Castbar:ClearAllPoints()
	Castbar:SetPoint("TOP", Power, "BOTTOM", 0, 2)
	Castbar:SetSize(129, 2)
	Castbar:SetFrameLevel(10)
	Castbar:CreateBackdrop()
	
	Castbar.Button:Hide()
	Castbar.Text:Hide()

	----------------------------------------------------
	----- Misc
	----------------------------------------------------

	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:SetPoint("LEFT", Health, "LEFT", 4, 1)
	
	Buffs.num = 0
	Debuffs.num = 0
	
	RaidIcon:ClearAllPoints()
	RaidIcon:SetSize(20, 20)
	RaidIcon:SetPoint("TOPLEFT", Health, "TOPLEFT", 0, 15)
end