-- Credits: Saft for getting this shit to work after giving me much headaches.

local P, C, L, G = unpack(Tukui)
if P.myclass ~= "PALADIN" or C.unitframes.classbar ~= true then return end

local self = _G["TukuiPlayer"]

self.HolyPower:ClearAllPoints()
self.HolyPower:SetPoint("BOTTOM", self, "TOP", 0, 3)
self.HolyPower:Size(self:GetWidth(), 6) --240 
self.HolyPower:SetBackdrop(nil)

self.HolyPower:RegisterEvent('PLAYER_LEVEL_UP')
self.HolyPower:RegisterEvent('PLAYER_ENTERING_WORLD')
self.HolyPower:SetScript('OnEvent', function(self, event)
	local maxHolyPower = UnitLevel('player') < 85 and 3 or 5
	local totalWidth = self:GetWidth()

	for i = 1, maxHolyPower do
		self[i]:SetStatusBarColor(228/255, 225/255, 16/255)
		self[i]:SetBorder(false, true)
		
		self[i]:ClearAllPoints()
		if i == 1 then 
			self[i]:SetPoint("LEFT", self, "LEFT", 0, 0)
		else
			self[i]:SetPoint("LEFT", self[i-1], "RIGHT", 3, 0)
		end

		self[i]:SetSize((totalWidth-((maxHolyPower-1)*3))/maxHolyPower, 6)

		if i == maxHolyPower then
			self[i]:SetPoint("RIGHT", self, "RIGHT", 0, 0)
		end
	end
end)