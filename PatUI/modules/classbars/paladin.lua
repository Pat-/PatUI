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
	
	HPBar:Size(240, 5)
	HPBar:SetFrameLevel(5)
	HPBar:ClearAllPoints()
	HPBar:Point("BOTTOM", Health, "TOP", 0, 3)
	
	for i = 1, 5 do
		HPBar[i]:ClearAllPoints()
		
		if i == 1 then
			HPBar[i]:Height(5)
			HPBar[i]:Width(48)
			HPBar[i]:Point("LEFT", HPBar, "LEFT", 0, 0)
		else
			HPBar[i]:Height(5)
			HPBar[i]:Width(47)
			HPBar[i]:Point("LEFT", HPBar[i-1], "RIGHT", 1, 0)
		end
	end
end		
hooksecurefunc(TukuiUnitFrames, "Player", Player)