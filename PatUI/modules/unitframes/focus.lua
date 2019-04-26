local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local UnitFrames = T.UnitFrames
local Noop = function() end

local baseCreateUnits = UnitFrames.CreateUnits
local baseFocus = UnitFrames.Focus

function UnitFrames:CreateUnits()
	-- Call the base function first
	baseCreateUnits(self)
	
	-- Then my stuff
	local Focus = UnitFrames.Units.Focus

	Focus:SetHeight(23)
	Focus:SetWidth(240)
	
	Focus:ClearAllPoints()
	if C["Raid"]["Healer"] == true then
		Focus:SetPoint("BOTTOM", UIParent, "BOTTOM", -600, 400)
	else
		Focus:SetPoint("BOTTOM", UIParent, "BOTTOM", -400, 400)
	end
end

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
	
	Health:SetHeight(23)
	Health:SetFrameLevel(5)
	Health:SetFrameStrata("LOW")
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:SetColorTexture(.1, .1, .1)
	
	Health.colorTapping = false
	Health.colorDisconnected = false
	Health.colorClass = false
	Health.colorReaction = false

	Health.Value:ClearAllPoints()
	Health.Value:Point("RIGHT", Health, "RIGHT", -2, -4)

	Power:ClearAllPoints()
	Power:Point("TOPRIGHT", Health, "BOTTOMRIGHT", -4, 1)
	Power:SetHeight(3)
	Power:SetWidth(90)
	Power:SetFrameLevel(10)
	Power:CreateBackdrop("Default")
	Power:CreateShadow()

	Power.Value:ClearAllPoints()
	Power.Value:Point("LEFT", Health, "LEFT", 2, -4)
	Power.Value:SetShadowOffset(0, 0)

	Castbar:SetSize(240, 16)
	Castbar:ClearAllPoints()
	Castbar:Point("TOP", Power, "BOTTOM", 0, -7)
	Castbar:CreateBackdrop("Transparent")

	Castbar.Time:ClearAllPoints()
	Castbar.Time:Point("RIGHT", Castbar, "RIGHT", -4, 1)

	Castbar.Text:ClearAllPoints()
	Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 1)
	
end