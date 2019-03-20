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
	
	SoulShards:Size(240, 5)
	SoulShards:ClearAllPoints()
	SoulShards:SetFrameLevel(5)
	SoulShards:Point("BOTTOM", Health, "TOP", 0, 3)
	SoulShards:CreateShadow()
	
	for i = 1, 5 do
		SoulShards[i]:ClearAllPoints()
		SoulShards[i]:SetParent(self)
		SoulShards[i]:SetFrameLevel(5)
		
		if i == 1 then
			SoulShards[i]:Height(5)
			SoulShards[i]:Width(48)
			SoulShards[i]:Point("LEFT", SoulShards, "LEFT", 0, 0)
		else
			SoulShards[i]:Height(5)
			SoulShards[i]:Width(47)
			SoulShards[i]:Point("LEFT", SoulShards[i-1], "RIGHT", 1, 0)
		end
	end
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)