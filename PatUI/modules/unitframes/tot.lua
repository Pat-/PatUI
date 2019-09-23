local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames
local Noop = function() end
local MyRealm = GetRealmName()
local MyName = UnitName("player")

local baseCreateUnits = UnitFrames.CreateUnits
local baseToT = UnitFrames.TargetOfTarget

function UnitFrames:CreateUnits()
	-- Call the base function first
	baseCreateUnits(self)
	
	-- Then my stuff
	local ToT = UnitFrames.Units.TargetOfTarget
	local Target = UnitFrames.Units.Target
	
	if IsPat(UnitName"Player") then
		ToT:SetHeight(18)
		ToT:SetWidth(130)
	else
		ToT:SetHeight(23)
		ToT:SetWidth(110)
	end
	
	ToT.Shadow:Kill()
	
	ToT:ClearAllPoints()
	if C["PatUI"]["Healer"] == true then
		ToT:SetPoint("TOPRIGHT", Target, "BOTTOMRIGHT", 0, -36)
	else
		ToT:SetPoint("BOTTOM", PatBar1, "TOP", 0, 50)
	end
	ToT:SetBackdrop(nil)
end

function UnitFrames:TargetOfTarget()
	-- Call the base function first
	baseToT(self)
	
	-- Then my stuff
	local Panel = self.Panel
	local Health = self.Health
	local Name = self.Name
	local Panel = self.Panel
	local PowerTexture = T.GetTexture(C["Textures"].UFPowerTexture)
	
	Panel:Hide()
	
	if IsPat(UnitName"Player") then
		local power = CreateFrame('StatusBar', nil, self)
		power:Point("TOPLEFT", Health, "BOTTOMLEFT", 0, -3)
		power:Point("TOPRIGHT", Health, "BOTTOMRIGHT", 0, -3)
		power:SetFrameLevel(4)
		power:SetFrameStrata(self:GetFrameStrata())
		power:Height(3)
		power:SetStatusBarTexture(PowerTexture)
		self.Power = power
		
		power.frequentUpdates = true
		power.colorPower = true
			
		Health:SetHeight(18)
		
		local ufbg = CreateFrame("Frame", nil, self)
		ufbg:SetFrameLevel(Health:GetFrameLevel() - 1)
		ufbg:SetFrameStrata(Health:GetFrameStrata())
		ufbg:Size(1, 1)
		ufbg:Point("TOPLEFT", Health, -2, 2)
		ufbg:Point("BOTTOMRIGHT", power, 2, -2)
		ufbg:PatUI()
		ufbg:CreateShadow()
			
		local powerbg = CreateFrame("Frame", nil, self)
		powerbg:SetFrameLevel(Health:GetFrameLevel() - 1)
		powerbg:SetFrameStrata(Health:GetFrameStrata())
		powerbg:Size(1, 1)
		powerbg:Point("TOPLEFT", power, -2, 2)
		powerbg:Point("BOTTOMRIGHT", power, 2, -2)
		powerbg:PatUI()
		
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorTapping = false
		Health.colorDisconnected = false
		
		Health.Background:ClearAllPoints()
		Health.Background:SetAllPoints()
		
		Health:SetStatusBarColor(.15, .15, .15)
		Health.Background:SetColorTexture(.25, .1, .1)
		
		Name:ClearAllPoints()
		Name:SetParent(Health)
		Name:Point("CENTER", self.Health, "CENTER", 0, 0)
	else
		local power = CreateFrame('StatusBar', nil, self)
		power:Point("TOPRIGHT", Health, "BOTTOMRIGHT", -10, 1)
		power:SetFrameLevel(4)
		power:SetFrameStrata(self:GetFrameStrata())
		power:Height(3)
		power:Width(90)
		power:SetStatusBarTexture(PowerTexture)
		self.Power = power
		
		power.frequentUpdates = true
		power.colorPower = true
			
		Health:SetHeight(23)
		
		if C["PatUI"]["ThickBorders"] == true then
			local ufbg = CreateFrame("Frame", nil, self)
			ufbg:SetFrameLevel(Health:GetFrameLevel() - 1)
			ufbg:SetFrameStrata(Health:GetFrameStrata())
			ufbg:Size(1, 1)
			ufbg:Point("TOPLEFT", Health, -2, 2)
			ufbg:Point("BOTTOMRIGHT", Health, 2, -2)
			ufbg:PatUI()
			ufbg:CreateShadow()
			
			local powerbg = CreateFrame("Frame", nil, self)
			powerbg:SetFrameLevel(Health:GetFrameLevel() + 1)
			powerbg:SetFrameStrata(Health:GetFrameStrata())
			powerbg:Size(1, 1)
			powerbg:Point("TOPLEFT", power, -2, 2)
			powerbg:Point("BOTTOMRIGHT", power, 2, -2)
			powerbg:PatUI()
			powerbg:CreateShadow()
		else
			Health:CreateShadow()
			power:CreateFrame()
		end
		
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorTapping = false
		Health.colorDisconnected = false
		
		Health.Background:ClearAllPoints()
		Health.Background:SetAllPoints()
		
		Health:SetStatusBarColor(.15, .15, .15)
		Health.Background:SetColorTexture(.25, .1, .1)
		
		Name:ClearAllPoints()
		Name:SetParent(Health)
		Name:Point("CENTER", self.Health, "CENTER", 0, 0)
	end
end