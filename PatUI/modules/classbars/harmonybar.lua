local P, C, L, G = unpack(Tukui)
if P.myclass ~= "MONK" or C.unitframes.classbar ~= true then return end

local self = _G["TukuiPlayer"]

self.HarmonyBar:ClearAllPoints()
self.HarmonyBar:SetPoint("BOTTOM", self, "TOP", 0, 6)
self.HarmonyBar:Size(240, 3)
self.HarmonyBar:SetBackdrop(nil)
self.HarmonyBar:CreateBorder()

for i = 1, 5 do
	self.HarmonyBar[i]:Height(2)
	self.HarmonyBar[i]:SetBorder(false, true)
	if (i == 1) then
		self.HarmonyBar[i]:Width((240 / 5))
		self.HarmonyBar[i]:SetPoint("LEFT", self.HarmonyBar, "LEFT", 0, 0)
	else
		self.HarmonyBar[i]:Width((240 / 5) - 1)
		self.HarmonyBar[i]:Point("LEFT", self.HarmonyBar[i - 1], "RIGHT", 1, 0)
	end
end