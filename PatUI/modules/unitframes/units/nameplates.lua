local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T["UnitFrames"]
local baseNameplates = UnitFrames.Nameplates

function UnitFrames:Nameplates()
	-- First call the base function
	baseNameplates(self)

	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Name = self.Name
	local PatUI = [=[Interface\AddOns\PatUI\media\fonts\pixelfont.ttf]=]

	----------------------------------------------------
	----- Health
	----------------------------------------------------
	
	Health:SetHeight(4)

	Health:PatUI(nil, "Single")
	Health.Backdrop:SetBackdropBorderColor(0, 0, 0)
	Health.Backdrop:SetPoint("TOPLEFT", -1, 1)
	Health.Backdrop:SetPoint("BOTTOMRIGHT", 1, -1)

	Health.Backdrop:CreateThinShadow()
	Health.Backdrop.Shadow:SetPoint("TOPLEFT", -5, 5)
	Health.Backdrop.Shadow:SetPoint("BOTTOMRIGHT", 5, -5)

	----------------------------------------------------
	----- Power
	----------------------------------------------------

	-- Don't want a Power bar on nameplates
	Power:Hide()
	Power:SetHeight(0)

	----------------------------------------------------
	----- Castbar
	----------------------------------------------------

	if C["NamePlates"]["NameplateCastBar"] then
		Castbar:ClearAllPoints()
		Castbar:SetPoint("TOP", Health, "BOTTOM", 0, -7)
		Castbar:SetHeight(2)
		Castbar:SetWidth(Health:GetWidth())
		Castbar:PatUI(nil, "Single")

		Castbar.Backdrop:SetBackdropBorderColor(0, 0, 0)
		Castbar.Backdrop:SetPoint("TOPLEFT", -1, 1)
		Castbar.Backdrop:SetPoint("BOTTOMRIGHT", 1, -1)

		Castbar.Backdrop:CreateThinShadow()
		Castbar.Backdrop.Shadow:SetPoint("TOPLEFT", -5, 5)
		Castbar.Backdrop.Shadow:SetPoint("BOTTOMRIGHT", 5, -5)

		Castbar.Background:SetAllPoints(Castbar)
		
		Castbar.Icon:ClearAllPoints()
		Castbar.Button:ClearAllPoints()
		Castbar.Button.Shadow:Kill()
	end

	----------------------------------------------------
	----- Misc
	----------------------------------------------------

	Name:SetFont(PatUI, 10, "MONOCHROMEOUTLINE")
	self:SetHeight(4)
end
