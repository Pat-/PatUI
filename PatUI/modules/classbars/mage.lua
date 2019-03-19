local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "MAGE") then
	return
end

------------------------------------------------------------------------------------------
-- Arcane Charges
------------------------------------------------------------------------------------------
local function Player(self)
	local ArcaneChargeBar = self.ArcaneChargeBar
	local Health = self.Health
	local Shadow = self.Shadow
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)