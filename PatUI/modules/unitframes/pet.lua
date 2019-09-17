local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames	
local Noop = function() end

local baseCreateUnits = UnitFrames.CreateUnits
local basePet = UnitFrames.Pet

function UnitFrames:CreateUnits()
	-- Call the base function first
	baseCreateUnits(self)
	
	-- Then my stuff
	local Pet = UnitFrames.Units.Pet
	local Player = UnitFrames.Units.Player

	Pet:SetHeight(23)
	Pet:SetWidth(110)
	Pet.Shadow:Kill()
	
	Pet:ClearAllPoints()
	if C["PatUI"]["Healer"] == true then
		Pet:SetPoint("TOPLEFT", Player, "BOTTOMLEFT", 0, -30)
	else
		Pet:SetPoint("BOTTOM", PatBar1, "TOP", 0, 90)
	end
	Pet:SetBackdrop(nil)
end

function UnitFrames:Pet()
	-- Call the base function first
	basePet(self)
	
	-- Then my stuff
	local Health = self.Health
	local Name = self.Name
	local Panel = self.Panel
	local Power = self.Power
	
	Panel:Hide()
	Power:SetHeight(0)
	
	Health:SetHeight(23)
	Health:CreateShadow()
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:ClearAllPoints()
	Health.Background:SetAllPoints()
	Health.Background:SetColorTexture(0.6, 0.6, 0.6)
	
	Health.colorTapping = false
	Health.colorDisconnected = false
	Health.colorClass = false
	Health.colorReaction = false
	
	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:Point("CENTER", Health, "CENTER", 0, 0)
	
	Name.colorHappiness = true
	Health.colorHappiness = false
	
	Health.Value:ClearAllPoints()
	Health.Value:SetParent(Health)
	Health.Value:Point("CENTER", Health, "CENTER", 0, 0)
end