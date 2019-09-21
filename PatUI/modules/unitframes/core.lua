local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T["UnitFrames"]
local Noop = function() end

local basePostCreateAura = UnitFrames.PostCreateAura

function UnitFrames:PostCreateAura(button)
	basePostCreateAura(self, button)
	
	if C["PatUI"]["ThickBorders"] == true then
		local bg = CreateFrame("Frame", nil, button)
		bg:SetFrameLevel(button:GetFrameLevel() - 1)
		bg:SetFrameStrata(button:GetFrameStrata())
		bg:Size(1, 1)
		bg:Point("TOPLEFT", button, -1.5, 1.5)
		bg:Point("BOTTOMRIGHT", button, 1.5, -1.5)
		bg:PatUI("Transparent")
		bg:CreateShadow()		
		
		button.Shadow:Kill()
	end
end