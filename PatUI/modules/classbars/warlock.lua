local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "WARLOCK") then
	return
end

------------------------------------------------------------------------------------------
-- Soul Shards
------------------------------------------------------------------------------------------
local function Player(self)
	local SoulShards = self.SoulShards
	local Health = self.Health
	local Shadow = self.Shadow
	local Totems = self.Totems
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)