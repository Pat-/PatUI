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
	
	Harmony:Size(240, 5)
	Harmony:SetFrameLevel(5)
	Harmony:Hide()
	Harmony:ClearAllPoints()
	Harmony:Point("BOTTOM", Health, "TOP", 0, 3)
	Harmony:CreateShadow()
				
	
	for i = 1, 6 do
		Harmony[i]:ClearAllPoints()
		--Harmony[i]:SetParent(self)
		Harmony[i]:SetFrameLevel(5)
		
		if i == 1 then
			Harmony[i]:Height(5)
			Harmony[i]:Width(40)
			Harmony[i]:Point("LEFT", Harmony, "LEFT", 0, 0)
			Harmony[i].Ascension = Harmony[i]:GetWidth()
			Harmony[i].NoTalent = 48
		else
			Harmony[i]:Height(5)
			Harmony[i]:Width(39)
			Harmony[i]:Point("LEFT", Harmony[i-1], "RIGHT", 1, 0)
			Harmony[i].Ascension = Harmony[i]:GetWidth()
			Harmony[i].NoTalent = 47
		end
	end
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)