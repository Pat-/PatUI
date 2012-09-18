local P, C, L, G = unpack(Tukui)
if P.myclass ~= "DEATHKNIGHT" or C.unitframes.classbar ~= true then return end

local self = _G["TukuiPlayer"]

self.Runes:ClearAllPoints()
self.Runes:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 6)
self.Runes:Size(self:GetWidth(), 6)
self.Runes:CreateBorder()

for i = 1, 6 do
	self.Runes[i]:Size((self:GetWidth() / 6) - 1, 6)
	if(i == 1) then
		self.Runes[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 6)
	else
		self.Runes[i]:Point("LEFT", self.Runes[i - 1], "RIGHT", 1, 0)
	end
end