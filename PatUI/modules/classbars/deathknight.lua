local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "DEATHKNIGHT") then
	return
end

------------------------------------------------------------------------------------------
-- Runebar
------------------------------------------------------------------------------------------

local function Player(self)
	local Runebar = self.Runes
	local Shadow = self.Shadow
	local Health = self.Health
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)