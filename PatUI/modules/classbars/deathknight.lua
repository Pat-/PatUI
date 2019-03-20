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
	
	Runebar:ClearAllPoints()
	Runebar:Size(240, 5)
	Runebar:SetFrameLevel(5)
	Runebar:Point("BOTTOM", Health, "TOP", 0, 3)
	Runebar:CreateShadow()
	
	for i = 1, 6 do
		Runebar[i]:ClearAllPoints()
		Runebar[i]:SetParent(self)
		Runebar[i]:SetFrameLevel(5)
		
		if i == 1 then
			Runebar[i]:Height(5)
			Runebar[i]:Width(40)
			Runebar[i]:Point("LEFT", Runebar, "LEFT", 0, 0)
		else
			Runebar[i]:Height(5)
			Runebar[i]:Width(39)
			Runebar[i]:Point("LEFT", Runebar[i-1], "RIGHT", 1, 0)
		end
	end
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)