local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "MAGE") then
	return
end

------------------------------------------------------------------------------------------
-- Arcane Charges
------------------------------------------------------------------------------------------

local basePlayer = TukuiUnitFrames.Player

function TukuiUnitFrames:Player()
	-- Call the base function first
	basePlayer(self)
	
	-- Then my stuff
	local ArcaneChargeBar = self.ArcaneChargeBar
	local Health = self.Health
	local Shadow = self.Shadow
	
	ArcaneChargeBar:Size(240, 5)
	ArcaneChargeBar:Hide()
	ArcaneChargeBar:ClearAllPoints()
	ArcaneChargeBar:Point("BOTTOM", Health, "TOP", 0, 3)
	ArcaneChargeBar:CreateShadow()
	
	for i = 1, 4 do
		ArcaneChargeBar[i]:ClearAllPoints()
		--ArcaneChargeBar[i]:SetParent(self)
		ArcaneChargeBar[i]:SetFrameLevel(5)
		
		if i == 1 then
			ArcaneChargeBar[i]:Height(5)
			ArcaneChargeBar[i]:Width(60)
			ArcaneChargeBar[i]:Point("LEFT", ArcaneChargeBar, "LEFT", 0, 0)
		else
			ArcaneChargeBar[i]:Height(5)
			ArcaneChargeBar[i]:Width(59)
			ArcaneChargeBar[i]:Point("LEFT", ArcaneChargeBar[i-1], "RIGHT", 1, 0)
		end
	end
	
end