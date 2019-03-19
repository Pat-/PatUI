local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "PALADIN") then
	return
end

------------------------------------------------------------------------------------------
-- Holy Power
------------------------------------------------------------------------------------------
local function Player(self)
	local HPBar = self.HolyPower
	local Shadow = self.Shadow
	local Health = self.Health
end		
hooksecurefunc(TukuiUnitFrames, "Player", Player)