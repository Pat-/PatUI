local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "PRIEST") then
	return
end

------------------------------------------------------------------------------------------
-- Atonement
------------------------------------------------------------------------------------------
local function Player(self)
	local Health = self.Health
	local Shadow = self.Shadow
	local Atonement = self.Atonement
	
	Atonement:ClearAllPoints()
	Atonement:SetPoint("BOTTOM", Health, "TOP", 0, 3)
	Atonement:SetHeight(5)
	Atonement:SetWidth(240)
	Atonement:CreateShadow()
	Atonement:SetFrameStrata("BACKGROUND")
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)