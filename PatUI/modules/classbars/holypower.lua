local P, C, L = unpack(Tukui)
if P.myclass ~= "PALADIN" or C.unitframes.classbar ~= true then return end

local self = _G["TukuiPlayer"]

self.HolyPower:ClearAllPoints()
self.HolyPower:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 6)
self.HolyPower:Size(self:GetWidth(), 10)
self.HolyPower:CreateBorder()

for i = 1, 5 do
	self.HolyPower[i]:SetStatusBarColor(228/255, 225/255, 16/255)
	if(i == 5) then
		self.HolyPower[i]:Size((self:GetWidth() / 5) - 2, 10)
	else
		self.HolyPower[i]:Size((self:GetWidth() / 5), 10)
	end

	if(i == 1) then
		self.HolyPower[i]:SetPoint("LEFT", self.HolyPower, "LEFT", 0, 0)
	else
		self.HolyPower[i]:Point("LEFT", self.HolyPower[i - 1], "RIGHT", 1, 0)
	end
end