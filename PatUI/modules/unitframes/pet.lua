local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames	
local Noop = function() end

local function CreateUnits()
	local Pet = UnitFrames.Units.Pet

	Pet:SetHeight(23)
	Pet:SetWidth(110)
	
	Pet:ClearAllPoints()
	Pet:SetPoint("BOTTOM", PatBar1, "TOP", 0, 90)
	Pet:SetBackdrop(nil)
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

local function Pet(self)
	local Health = self.Health
	local Name = self.Name
	local Panel = self.Panel
	local Power = self.Power
	local RaidIcon = self.RaidTargetIndicator
	local PBar = T.Panels.PetActionBar
	
	Panel:Hide()
	Power:SetHeight(0)
	
	Health:SetHeight(23)
	Health:SetFrameLevel(5)
	Health:CreateShadow()
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:SetColorTexture(.1, .1, .1)
	
	Health.colorClass = false
	Health.colorReaction = false
	
	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:Point("CENTER", Health, "CENTER", 0, 0)
end
hooksecurefunc(UnitFrames, "Pet", Pet)