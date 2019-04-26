local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "PRIEST") then
	return
end

------------------------------------------------------------------------------------------
-- Atonement
------------------------------------------------------------------------------------------

local basePlayer = TukuiUnitFrames.Player

function TukuiUnitFrames:Player()
	-- Call the base function first
	basePlayer(self)
	
	-- Then my stuff
	local Health = self.Health
	local Shadow = self.Shadow
	local Atonement = self.Atonement
	
	Atonement:ClearAllPoints()
	Atonement:SetPoint("BOTTOM", Health, "TOP", 0, 3)
	Atonement:SetHeight(5)
	Atonement:SetWidth(238)
	Atonement:CreateShadow()
	Atonement:SetFrameStrata("BACKGROUND")
end