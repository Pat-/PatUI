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
	
	Panel:Hide()
		
	Health:SetHeight(23)
	
	if C["PatUI"]["ThickBorders"] == true then
		local ufbg = CreateFrame("Frame", nil, self)
		ufbg:SetFrameLevel(Health:GetFrameLevel() - 1)
		ufbg:SetFrameStrata(Health:GetFrameStrata())
		ufbg:Size(1, 1)
		ufbg:Point("TOPLEFT", Health, -2, 2)
		ufbg:Point("BOTTOMRIGHT", Health, 2, -2)
		ufbg:PatUI()
		ufbg:CreateShadow()
	else
		Health:CreateShadow()
	end
	
	Health:SetStatusBarColor(.15, .15, .15)
	Health.Background:SetColorTexture(.05, .05, .05)
	Health.Background:ClearAllPoints()
	Health.Background:SetAllPoints()
	
	Health.colorClass = false
	Health.colorReaction = false
	Health.colorTapping = false
	Health.colorDisconnected = false
	
	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:Point("CENTER", self.Health, "CENTER", 0, 0)
end