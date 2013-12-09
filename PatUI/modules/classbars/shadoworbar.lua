local P, C, L, G = unpack(Tukui)
if P.myclass ~= "PRIEST" or C.unitframes.classbar ~= true then return end

self = _G["TukuiPlayer"]

self.ShadowOrbsBar:ClearAllPoints()
self.ShadowOrbsBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 3)
self.ShadowOrbsBar:Size(self:GetWidth(), 6)
self.ShadowOrbsBar:CreateBorder()

for i = 1, 3 do
	self.ShadowOrbsBar[i]:Size((self:GetWidth() / 3) - 0.9, 6)
	
	if (i == 1) then
		self.ShadowOrbsBar[i]:SetPoint("LEFT", self.ShadowOrbsBar, "LEFT", 0, 0)
	else
		self.ShadowOrbsBar[i]:SetPoint("LEFT", self.ShadowOrbsBar[i - 1], "RIGHT", 1, 0)
	end
end