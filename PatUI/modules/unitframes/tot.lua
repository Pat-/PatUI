local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames
local Noop = function() end

local function CreateUnits()
	local ToT = UnitFrames.Units.TargetOfTarget

	ToT:SetHeight(23)
	ToT:SetWidth(110)
	
	ToT:ClearAllPoints()
	ToT:SetPoint("BOTTOM", PatBar1, "TOP", 0, 50)
	ToT:SetBackdrop(nil)
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

local function TargetOfTarget(self)
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
hooksecurefunc(UnitFrames, "TargetOfTarget", TargetOfTarget)