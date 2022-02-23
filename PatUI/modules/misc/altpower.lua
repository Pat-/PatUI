--[[local T, C, L = Tukui:unpack()

local Miscellaneous = T["Miscellaneous"]
local AltPowerBar = Miscellaneous.AltPowerBar

local baseCreate = AltPowerBar.Create

function AltPowerBar:Create()
	baseCreate(self)

	self:PatUI()

	self.Status:SetInside(self)
end
]]--