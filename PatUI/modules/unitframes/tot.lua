local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames
local Noop = function() end

local baseCreateUnits = UnitFrames.CreateUnits
local baseToT = UnitFrames.TargetOfTarget

function UnitFrames:CreateUnits()
	-- Call the base function first
	baseCreateUnits(self)
	
	-- Then my stuff
	local ToT = UnitFrames.Units.TargetOfTarget
	local Target = UnitFrames.Units.Target

	ToT:SetHeight(23)
	ToT:SetWidth(110)
	
	ToT.Shadow:Kill()
	
	ToT:ClearAllPoints()
	if C["PatUI"]["Healer"] == true then
		ToT:SetPoint("TOPRIGHT", Target, "BOTTOMRIGHT", 0, -36)
	else
		ToT:SetPoint("BOTTOM", PatBar1, "TOP", 0, 50)
	end
	ToT:SetBackdrop(nil)
end

function UnitFrames:TargetOfTarget()
	-- Call the base function first
	baseToT(self)
	
	-- Then my stuff
	local Panel = self.Panel
	local Health = self.Health
	local Name = self.Name
	local Panel = self.Panel
	local RaidIcon = self.RaidTargetIndicator
	
	Panel:Hide()
	
	Health:SetHeight(23)
	Health:SetFrameLevel(5)
	Health:CreateShadow()
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:SetColorTexture(.1, .1, .1)
	
	Health.colorClass = false
	Health.colorReaction = false
    Health.colorTapping = false
    Health.colorDisconnected = false
	
	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:Point("CENTER", self.Health, "CENTER", 0, 0)
end