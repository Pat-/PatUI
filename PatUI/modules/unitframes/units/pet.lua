local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames	
local Noop = function() end

local basePet = UnitFrames.Pet

function UnitFrames:Pet()
	-- Call the base function first
	basePet(self)
	
	-- Then my stuff
	local Health = self.Health
	local Name = self.Name
	local Panel = self.Panel
	local Power = self.Power

	Health:SetHeight(2)
	Health:SetFrameLevel(5)

	Health:PatUI()
	Health.Backdrop:SetBackdropBorderColor(0, 0, 0)
	Health.Backdrop:SetOutside()
	Health.Backdrop:SetFrameStrata("BACKGROUND")
	
	Health:CreateThinShadow()
	Health.Shadow:SetOutside(Health.Backdrop, 6, 6)

	Health:SetStatusBarColor(.21, .2, .18)
	Health.Background:SetColorTexture(.38, .40, .40)
	
	Health.colorClass = false
	Health.colorReaction = false
	
	Name:ClearAllPoints()
	Panel:Hide()
	Power:ClearAllPoints()
end