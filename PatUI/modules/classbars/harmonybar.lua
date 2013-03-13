local P, C, L, G = unpack(Tukui)
if P.myclass ~= "MONK" or C.unitframes.classbar ~= true then return end

local self = _G["TukuiPlayer"]

self.HarmonyBar:ClearAllPoints()
self.HarmonyBar:SetPoint("BOTTOM", self, "TOP", 0, 6)
self.HarmonyBar:Size(240, 6)
self.HarmonyBar:SetBackdrop(nil)

for i = 1, 4 do
	self.HarmonyBar[i]:Size(55, 2)
	self.HarmonyBar[i]:SetBorder(false, true)
	if (i == 1) then
		self.HarmonyBar[i]:SetPoint("BOTTOM", self, "TOP", 0, 6)
	else
		self.HarmonyBar[i]:Point("LEFT", self.HarmonyBar[i - 1], "RIGHT", 3, 0)
	end
end