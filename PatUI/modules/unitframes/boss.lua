local T, C, L = Tukui:unpack()

local UnitFrames = T.UnitFrames

local function CreateUnits()
	local Boss = UnitFrames.Units.Boss
	
	for i = 1, 5 do
		if (i == 1) then
			Boss[i]:ClearAllPoints()
			Boss[i]:SetPoint("RIGHT", UIParent, "RIGHT", -100, 0)
		else
			Boss[i]:SetPoint("BOTTOM", Boss[i-1], "TOP", 0, 35)      
		end
		
		Boss[i]:Height(23)
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

local function Boss(self)
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local AltPower = self.AlternativePower
	local Name = self.Name
	local RaidIcon = self.RaidTargetIndicator
	
	self:Height(23)
	
	Health:Size(215, 23)
	Health:CreateShadow()
	
	Health.Value:ClearAllPoints()
	Health.Value:Point("RIGHT", Health, "RIGHT", -4, 0)
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:SetColorTexture(.1, .1, .1)
	
	Health.colorClass = false
	Health.colorReaction = false
	
	Power:ClearAllPoints()
	Power:Point("TOPLEFT", Health, "BOTTOMLEFT", 4, 1)
	Power:SetHeight(3)
	Power:SetWidth(90)
	Power:SetFrameLevel(10)
	Power:CreateShadow()
	
	Power.Value:ClearAllPoints()
	Power.Value:Point("LEFT", Health, "LEFT", 2, 0)
	
	Name:Point("CENTER", self.Health, "CENTER", 0, 0)
	
	Castbar:ClearAllPoints()
	Castbar:SetInside(Health)
	Castbar:SetFrameLevel(15)
	
	Castbar.Button:Hide()
	
	Castbar.Time:ClearAllPoints()
	Castbar.Time:Point("RIGHT", Castbar, "RIGHT", -4, 1)

	Castbar.Text:ClearAllPoints()
	Castbar.Text:Point("LEFT", Castbar, "LEFT", 4, 1)
	
	Buffs.num = 0
	Debuffs.num = 0
	
	RaidIcon:ClearAllPoints()
	RaidIcon:Size(20)
	RaidIcon:Point("TOP", Health, "TOP", 0, 0)
end
hooksecurefunc(UnitFrames, "Boss", Boss)