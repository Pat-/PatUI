local P, C, L, G = unpack(Tukui)
if P.myclass ~= "PALADIN" or C.unitframes.classbar ~= true then return end

local self = _G["TukuiPlayer"]

self.HolyPower:ClearAllPoints()
self.HolyPower:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 6)
self.HolyPower:Size(self:GetWidth(), 6)
self.HolyPower:CreateBorder()

if P.level ~= MAX_PLAYER_LEVEL then
	for i = 1, 3 do
		self.HolyPower[i]:SetStatusBarColor(228/255, 225/255, 16/255)
		if(i == 3) then
			self.HolyPower[i]:Size((self:GetWidth() / 5) - 2, 6)
		else
			self.HolyPower[i]:Size((self:GetWidth() / 5), 6)
		end

		if(i == 1) then
			self.HolyPower[i]:SetPoint("LEFT", self.HolyPower, "LEFT", 0, 0)
		else
			self.HolyPower[i]:Point("LEFT", self.HolyPower[i - 1], "RIGHT", 1, 0)
		end
	end
else
	for i = 1, 5 do
		self.HolyPower[i]:SetStatusBarColor(228/255, 225/255, 16/255)
		if(i == 5) then
			self.HolyPower[i]:Size((self:GetWidth() / 5) - 2, 6)
		else
			self.HolyPower[i]:Size((self:GetWidth() / 5), 6)
		end

		if(i == 1) then
			self.HolyPower[i]:SetPoint("LEFT", self.HolyPower, "LEFT", 0, 0)
		else
			self.HolyPower[i]:Point("LEFT", self.HolyPower[i - 1], "RIGHT", 1, 0)
		end
	end
end