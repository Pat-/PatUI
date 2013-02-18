local P, C, L, G = unpack(Tukui)
if P.myclass ~= "DEATHKNIGHT" or C.unitframes.classbar ~= true then return end

local self = _G["TukuiPlayer"]

self.Runes:ClearAllPoints()
self.Runes:SetPoint("BOTTOM", self, "TOP", 0, 6)
self.Runes:Size(self:GetWidth(), 6)
self.Runes:SetBackdrop(nil)

for i = 1, 6 do
	self.Runes[i]:SetBorder(false, true)
	if(i == 1) then
		self.Runes[i]:Size((225 / 6) - 3, 6)
		self.Runes[i]:ClearAllPoints()
		self.Runes[i]:SetPoint("LEFT", self.Runes, "LEFT", 0, 0)
	else
		self.Runes[i]:ClearAllPoints()
		self.Runes[i]:Size((225 / 6), 6)
		self.Runes[i]:Point("LEFT", self.Runes[i - 1], "RIGHT", 3, 0)
	end
end