local P, C, L, G = unpack(Tukui)
if P.myclass ~= "DEATHKNIGHT" or C.unitframes.classbar ~= true then return end

local self = _G["TukuiPlayer"]

self.Runes:ClearAllPoints()
self.Runes:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, -1)
self.Runes:Size(130, 3)
self.Runes:CreateBorder()
self.Runes:SetFrameLevel(10)

for i = 1, 6 do
	self.Runes[i]:SetSize(20.9, 3)
	
	self.Runes[i]:ClearAllPoints()
	if(i == 1) then
		self.Runes[i]:SetPoint("LEFT", self.Runes, "LEFT", 0, 0)
	else
		self.Runes[i]:Point("LEFT", self.Runes[i - 1], "RIGHT", 1, 0)
	end
end