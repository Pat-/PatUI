local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local TukuiUnitFrames = T["UnitFrames"]
local baseNameplates = TukuiUnitFrames.Nameplates

function TukuiUnitFrames:Nameplates()
	-- First call the base function
	baseNameplates(self)

	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	
	Health:ClearAllPoints()
	Health:SetAllPoints(self)
	Health:SetHeight(9)
	Health:CreateBackdrop("Transparent")
	Health.Background:Hide()
	
	if C["PatUI"]["ThickBorders"] == true then
		local ufbg = CreateFrame("Frame", nil, self)
		ufbg:SetFrameLevel(Health:GetFrameLevel() - 1)
		ufbg:SetFrameStrata(Health:GetFrameStrata())
		ufbg:Size(1, 1)
		ufbg:Point("TOPLEFT", Health, -2, 2)
		ufbg:Point("BOTTOMRIGHT", Health, 2, -2)
		ufbg:PatUI("Transparent")
		ufbg:CreateShadow()
	else
		Health:CreateShadow()
	end

	self:SetHeight(7)
	self.Shadow:Kill()
	
	
	if C["NamePlates"]["NameplateCastBar"] == true then
		Castbar:Hide()
		Castbar:SetHeight(0)
		
		Castbar.Icon:ClearAllPoints()
		Castbar.Button:ClearAllPoints()
		Castbar.Button.Shadow:Kill()
	end
	
	Power:Hide()
	Power:SetHeight(0)
end