local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames	
local Noop = function() end
local MyRealm = GetRealmName()
local MyName = UnitName("player")

local baseCreateUnits = UnitFrames.CreateUnits
local basePet = UnitFrames.Pet

function UnitFrames:CreateUnits()
	-- Call the base function first
	baseCreateUnits(self)
	
	-- Then my stuff
	local Pet = UnitFrames.Units.Pet
	local Player = UnitFrames.Units.Player

	if IsPat(UnitName"Player") then
		Pet:SetHeight(18)
		Pet:SetWidth(130)
	else
		Pet:SetHeight(23)
		Pet:SetWidth(110)
	end
	
	Pet.Shadow:Kill()
	
	Pet:ClearAllPoints()
	if C["PatUI"]["Healer"] == true then
		Pet:SetPoint("TOPLEFT", Player, "BOTTOMLEFT", 0, -30)
	else
		Pet:SetPoint("BOTTOM", PatBar1, "TOP", 0, 90)
	end
	Pet:SetBackdrop(nil)
end

function UnitFrames:Pet()
	-- Call the base function first
	basePet(self)
	
	-- Then my stuff
	local Health = self.Health
	local Name = self.Name
	local Panel = self.Panel
	local Power = self.Power
	
	Panel:Hide()
	
	if IsPat(UnitName"Player") then
		Power:ClearAllPoints()
		Power:Point("TOPLEFT", Health, "BOTTOMLEFT", 0, -3)
		Power:Point("TOPRIGHT", Health, "BOTTOMRIGHT", 0, -3)
		
		Health:SetHeight(19)
		
		local ufbg = CreateFrame("Frame", nil, self)
		ufbg:SetFrameLevel(Health:GetFrameLevel() - 1)
		ufbg:SetFrameStrata(Health:GetFrameStrata())
		ufbg:Size(1, 1)
		ufbg:Point("TOPLEFT", Health, -2, 2)
		ufbg:Point("BOTTOMRIGHT", Power, 2, -2)
		ufbg:PatUI()
		ufbg:CreateShadow()
			
		local powerbg = CreateFrame("Frame", nil, self)
		powerbg:SetFrameLevel(Health:GetFrameLevel() - 1)
		powerbg:SetFrameStrata(Health:GetFrameStrata())
		powerbg:Size(1, 1)
		powerbg:Point("TOPLEFT", Power, -2, 2)
		powerbg:Point("BOTTOMRIGHT", Power, 2, -2)
		powerbg:PatUI()
		
		Health.Background:ClearAllPoints()
		Health.Background:SetAllPoints()
		
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorTapping = false
		Health.colorDisconnected = false
		
		Health.PostUpdate = UnitFrames.PostUpdateHealth
		
		Name:ClearAllPoints()
		Name:SetParent(Health)
		Name:Point("CENTER", Health, "CENTER", 0, 0)
		
		Name.colorHappiness = true
		Health.colorHappiness = false
		
		Health.Value:ClearAllPoints()
		Health.Value:SetParent(Health)
		Health.Value:Point("CENTER", Health, "CENTER", 0, 0)	
	else
		Power:ClearAllPoints()
		Power:Point("TOPRIGHT", Health, "BOTTOMRIGHT", -10, 1)
		Power:SetHeight(3)
		Power:SetWidth(90)
		Power:SetFrameLevel(10)
		Power:CreateBackdrop("Default")
		Power.Background:Hide()
		
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
			powerbg:Point("TOPLEFT", Power, -2, 2)
			powerbg:Point("BOTTOMRIGHT", Power, 2, -2)
			powerbg:PatUI()
			powerbg:CreateShadow()
		else
			Health:CreateShadow()
			Power:CreateShadow()
		end
		
		Health.Background:ClearAllPoints()
		Health.Background:SetAllPoints()
		
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorTapping = false
		Health.colorDisconnected = false
		
		Health.PostUpdate = UnitFrames.PostUpdateHealth
		
		Name:ClearAllPoints()
		Name:SetParent(Health)
		Name:Point("CENTER", Health, "CENTER", 0, 0)
		
		Name.colorHappiness = true
		Health.colorHappiness = false
		
		Health.Value:ClearAllPoints()
		Health.Value:SetParent(Health)
		Health.Value:Point("CENTER", Health, "CENTER", 0, 0)
	end
end