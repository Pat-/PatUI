local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames
local Noop = function() end

local baseToT = UnitFrames.TargetOfTarget

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
	
	Health:SetHeight(15)
	Health:SetFrameLevel(5)
	
	Health:PatUI()
	Health.Backdrop:SetBackdropBorderColor(0, 0, 0)
	Health.Backdrop:SetOutside()
	Health.Backdrop:SetFrameStrata("BACKGROUND")

	Health:CreateShadow()
	Health.Shadow:SetOutside(Health.Backdrop, 6, 6)
	
	Health:SetStatusBarColor(.21, .2, .18)
	Health.Background:SetColorTexture(.38, .40, .40)
	
	Health.colorClass = false
	Health.colorReaction = false
    Health.colorTapping = false
    Health.colorDisconnected = false
	
	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:SetPoint("CENTER", self.Health, "CENTER", 0, 1)
	self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameShort]")
end