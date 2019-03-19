local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "PRIEST") then
	return
end

------------------------------------------------------------------------------------------
-- Shadow Orbs/Atonement
------------------------------------------------------------------------------------------
local function Player(self)
	local Health = self.Health
	local Shadow = self.Shadow
	local Atonement = self.Atonement
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)