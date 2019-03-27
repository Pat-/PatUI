local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "SHAMAN") then
	return
end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
local function Player(self)
	local TotemBar = self.Totems
	local Health = self.Health

	if (C.UnitFrames.TotemBar) then
		TotemBar:ClearAllPoints()
		TotemBar:SetPoint("BOTTOM", Health, "TOP", 0, 12)
	end
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)