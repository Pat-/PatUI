local P, C, L = unpack(Tukui)
if P.myclass ~= "MONK" or C.unitframes.classbar ~= true then return end

local self = _G["TukuiPlayer"]

self.HarmonyBar:ClearAllPoints()
self.HarmonyBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 6)
self.HarmonyBar:Size(self:GetWidth(), 2)
self.HarmonyBar:CreateBoreder()

local maxChi = UnitPowerMax("player", SPELL_POWER_LIGHT_FORCE)

for i = 1, maxChi do
	if(maxChi == 4) then
		if(i == 4 or i == 3) then
			self.HarmonyBar[i]:Size((self:GetWidth() / 4) - 1, 10)
		else
			self.HarmonyBar[i]:Size(self:GetWidth() / 4, 10)
		end

		if(i == 1) then
			self.HarmonyBar[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 6)
		else
			self.HarmonyBar[i]:Point("LEFT", self.HarmonyBar[i - 1], "RIGHT", 1, 0)
		end
	elseif(maxChi == 5) then
		if(i == 5) then
			self.HarmonyBar[i]:Size((self:GetWidth() / 5) - 1, 10)
		else
			self.HarmonyBar[i]:Size((self:GetWidth() / 5), 10)
		end

		if(i == 1) then
			self.HarmonyBar[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 6)
		else
			self.HarmonyBar[i]:Point("LEFT", self.HarmonyBar[i - 1], "RIGHT", 1, 0)
		end
	end
end