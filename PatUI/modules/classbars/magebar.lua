local P, C, L, G = unpack(Tukui)
if C.unitframes.mageclassbar ~= true or P.myclass ~= "MAGE" then return end

local self = _G["TukuiPlayer"]

self.ArcaneChargeBar:ClearAllPoints()
self.ArcaneChargeBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 6)
self.ArcaneChargeBar:Size(self:GetWidth(), 10)
self.ArcaneChargeBar:CreateBorder()

for i = 1, 6 do
	self.ArcaneChargeBar[i]:Size((self:GetWidth() / 6) - 1 , 10)
	if(i == 1) then
		self.ArcaneChargeBar[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 6)
	else
		self.ArcaneChargeBar[i]:Point("LEFT", self.ArcaneChargeBar[i - 1], "RIGHT", 1, 0)
	end
end