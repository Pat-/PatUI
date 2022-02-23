local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local UnitFrames = T.UnitFrames
local Noop = function() end

local baseFocus = UnitFrames.Focus

function UnitFrames:Focus()
	-- Call the base function first
	baseFocus(self)
	
	-- Then my stuff
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Name = self.Name
	local RaidIcon = self.RaidTargetIndicator

	----------------------------------------------------
	----- Health
	----------------------------------------------------
	
	Health:SetHeight(15)

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
	
	Health.colorTapping = false
	Health.colorDisconnected = false
	Health.colorClass = false
	Health.colorReaction = false

	----------------------------------------------------
	----- Power
	----------------------------------------------------

	Power:SetSize(131, 2)
	Power:ClearAllPoints()
	Power:SetPoint("TOPRIGHT", Health, "BOTTOMRIGHT", -8, -4)
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

	Castbar:ClearAllPoints()
	Castbar:SetPoint("TOP", Power, "BOTTOM", -1, 2)
	Castbar:SetSize(129, 2)
	Castbar:SetFrameLevel(10)
	Castbar:CreateBackdrop()

	Castbar.Text:ClearAllPoints()
	Castbar.Text:SetPoint("TOP", Castbar, "BOTTOM", 0, -5)

	Castbar.Icon:ClearAllPoints()
	Castbar.Button:ClearAllPoints()

	----------------------------------------------------
	----- Misc
	----------------------------------------------------

	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:SetPoint("LEFT", Health, "LEFT", 4, 1)

	Buffs:ClearAllPoints()
	Debuffs:ClearAllPoints()
end