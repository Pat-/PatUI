-- Credits: Saft for getting this shit to work after giving me much headaches.
local P, C, L, G = unpack(Tukui)
if P.myclass ~= "PALADIN" or C.unitframes.classbar ~= true then return end

local self = _G["TukuiPlayer"]

self.HolyPower:ClearAllPoints()
self.HolyPower:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, -1)
self.HolyPower:Size(130, 3) 
self.HolyPower:CreateBorder()
self.HolyPower:SetFrameLevel(10)

self.HolyPower:RegisterEvent('PLAYER_LEVEL_UP')
self.HolyPower:RegisterEvent('PLAYER_ENTERING_WORLD')
self.HolyPower:SetScript('OnEvent', function(self, event)
	local maxHolyPower = UnitLevel('player') < 85 and 3 or 5
	local totalWidth = 130

	for i = 1, maxHolyPower do
		self[i]:SetStatusBarColor(228/255, 225/255, 16/255)
		
		self[i]:ClearAllPoints()
		if i == 1 then 
			self[i]:SetPoint("LEFT", self, "LEFT", 0, 0)
		else
			self[i]:SetPoint("LEFT", self[i-1], "RIGHT", 1, 0)
		end

		self[i]:SetSize((totalWidth-((maxHolyPower-1)*3))/maxHolyPower, 3)

		if i == maxHolyPower then
			self[i]:SetPoint("RIGHT", self, "RIGHT", 0, 0)
		end
	end
end)