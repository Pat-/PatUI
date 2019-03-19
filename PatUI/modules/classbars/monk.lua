local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "MONK") then
	return
end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
local function Player(self)
	local Harmony = self.HarmonyBar
	local Health = self.Health
	local Shadow = self.Shadow
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)