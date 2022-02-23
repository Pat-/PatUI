local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames
local Noop = function() end

local baseTarget = UnitFrames.Target

function UnitFrames:Target()
	-- Call the base function first
	baseTarget(self)
	
	-- Then my stuff
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

	local HealthTexture = T.GetTexture(C["Textures"].UFHealthTexture)

	----------------------------------------------------
	----- Health
	----------------------------------------------------

	Health:SetHeight(15)
	Health:SetReverseFill(true)
	Health:SetStatusBarTexture(HealthTexture)

	Health:PatUI()
	Health.Backdrop:SetBackdropBorderColor(0, 0, 0)
	Health.Backdrop:SetOutside()
	Health.Backdrop:SetFrameStrata("BACKGROUND")

	Health:CreateThinShadow()
	Health.Shadow:SetOutside(Health.Backdrop, 6, 6)

	Health.Value:ClearAllPoints()
	Health.Value:SetPoint("RIGHT", Health, "RIGHT", -4, 1)
	
	Health:SetStatusBarColor(.21, .2, .18)
	Health.Background:SetColorTexture(.38, .40, .40)
	
	Health.colorClass = false
	Health.colorReaction = false
    Health.colorTapping = false
    Health.colorDisconnected = false

    ----------------------------------------------------
	----- Power
	----------------------------------------------------

	Power:SetSize(131, 2)
	Power:ClearAllPoints()
	Power:SetReverseFill(true)
	Power:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 8, -4)
	Power:SetFrameLevel(Health:GetFrameLevel())

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

	Castbar:SetSize(122.5, 4)
	Castbar:ClearAllPoints()
	Castbar:SetPoint("BOTTOM", TukuiActionBar1, "TOP", 0, 52)

	Castbar:PatUI()
	Castbar.Backdrop:SetBackdropBorderColor(0, 0, 0)
	Castbar.Backdrop:SetOutside()
	
	Castbar.Backdrop:SetOutside()

	Castbar:CreateThinShadow()
	Castbar.Shadow:SetOutside(Castbar.Backdrop, 6, 6)

	Castbar.Time:ClearAllPoints()

	Castbar.Text:ClearAllPoints()
	Castbar.Text:SetPoint("CENTER", Castbar, "CENTER", 0, 10)
	Castbar.Text:SetSize(122.5, 10)

	----------------------------------------------------
	----- Buffs & Debuffs
	----------------------------------------------------

	if (C["UnitFrames"]["TargetAuras"]) then
		Buffs:ClearAllPoints()
		Buffs:SetPoint("TOP", Power, "BOTTOMLEFT", 8, -8)
		Buffs:SetHeight(22)
		Buffs:SetWidth(131)
		Buffs.size = 22
		Buffs.num = 6
		Buffs.spacing = 1
		Buffs.initialAnchor = 'BOTTOM'
		Buffs["growth-y"] = "UP"
		Buffs["growth-x"] = "RIGHT"
		Buffs:SetParent(Power)
		Buffs.PostUpdate = UnitFrames.UpdateBuffsHeaderPosition
		
		Debuffs:SetHeight(23)
		Debuffs:SetWidth(212)
		Debuffs.size = 26
		Debuffs.num = 21
		Debuffs.spacing = 1
		Debuffs.initialAnchor = 'TOPLEFT'
		Debuffs["growth-y"] = "UP"
		Debuffs["growth-x"] = "RIGHT"
		Debuffs:ClearAllPoints()
		Debuffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -3, 12)
		Debuffs:SetParent(Health)
		
		Buffs.ClearAllPoints = T.dummy
		Debuffs.ClearAllPoints = T.dummy
	end

	----------------------------------------------------
	----- Misc
	----------------------------------------------------

	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:SetPoint("LEFT", Health, "LEFT", 4, 1)
	self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level]|r [shortclassification]")

	Panel:Hide()
	
	CombatFeedbackText:ClearAllPoints()

	if C.UnitFrames.HealComm then
		myBar:ClearAllPoints()
		otherBar:ClearAllPoints()
		absorbBar:ClearAllPoints()

		myBar:SetReverseFill(true)
		myBar:SetPoint("TOP")
		myBar:SetPoint("BOTTOM")
		myBar:SetPoint("RIGHT", Health:GetStatusBarTexture(), "LEFT")
		myBar:SetWidth(212)

		otherBar:SetReverseFill(true)
		otherBar:SetPoint("TOP")
		otherBar:SetPoint("BOTTOM")
		otherBar:SetPoint("RIGHT", Health:GetStatusBarTexture(), "LEFT")
		otherBar:SetWidth(212)

		absorbBar:SetReverseFill(true)
		absorbBar:SetPoint("TOP")
		absorbBar:SetPoint("BOTTOM")
		absorbBar:SetPoint("RIGHT", Health:GetStatusBarTexture(), "LEFT")
		absorbBar:SetWidth(212)
	end


end