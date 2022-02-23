local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "SHAMAN") then
	return
end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------

local basePlayer = TukuiUnitFrames.Player

function TukuiUnitFrames:Player()
	-- Call the base function first
	basePlayer(self)
	
	-- Then my stuff
	local TotemBar = self.Totems
	local Health = self.Health

	if (C.UnitFrames.TotemBar) and (Class == "SHAMAN") then
		TotemBar:ClearAllPoints()
		TotemBar:SetPoint("BOTTOM", Health, "TOP", 0, 12)
	end
end