local P, C, L, G = unpack(Tukui)
if P.myclass ~= "SHAMAN" or C.unitframes.classbar ~= true then return end

local self = _G["TukuiPlayer"]

for i = 1, 4 do
	self.TotemBar[i]:ClearAllPoints()
	self.TotemBar[i]:Size((self:GetWidth() / 4) - 7, 6)

	if(i == 1) then
		self.TotemBar[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 6)
	else
		self.TotemBar[i]:Point("LEFT", self.TotemBar[i - 1], "RIGHT", 9, 0)
	end

	self.TotemBar[i]:CreateBorder()
end