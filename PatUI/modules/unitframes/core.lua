local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T["UnitFrames"]
local Noop = function() end

local basePostCreateAura = UnitFrames.PostCreateAura
--[[
function UnitFrames:PostCreateAura()
	basePostCreateAura(self)
	
	self:CreateBackdrop()
	self.Backdrop:Point("TOPLEFT", self, "TOPLEFT", -1.5, 1.5)
	self.Backdrop:Point("BOTTOMRIGHT", self, "BOTTOMRIGHT", 1.5, -1.5)
	self:SetTemplate("Triple")
	self.icon:SetInside(self.Backdrop, 2, 2)
end
]]--