local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T["UnitFrames"]
local Noop = function() end

local baseCreateUnits = UnitFrames.CreateUnits
local baseTarget = UnitFrames.Target

function UnitFrames:CreateUnits()
	-- Call the base function first
	baseCreateUnits(self)
	
	-- Then my stuff
    local Target = UnitFrames.Units.Target
	
	Target:SetHeight(23)
	Target:SetWidth(240)
		
	Target.Shadow:Kill()
	
	Target:ClearAllPoints()
	if C["PatUI"]["Healer"] == true then
		Target:SetPoint("BOTTOMRIGHT", PatBar1, "TOPRIGHT", 254, 150)
	else
		Target:SetPoint("BOTTOMRIGHT", PatBar1, "TOPRIGHT", 160, 50)
	end
end

function UnitFrames:Target()
	-- Call the base function first
	baseTarget(self)
	
	-- Then my stuff
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Portrait = self.Portrait
	local Name = self.Name
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local CombatFeedbackText = self.CombatFeedbackText
	local Font = T.GetFont(C["UnitFrames"].Font)
	
	Panel:Hide()
	Panel:ClearAllPoints()
	Panel:Point("LEFT", Health, "LEFT", 4, 0)
	
	CombatFeedbackText:ClearAllPoints()
	
	Health:SetHeight(23)
	
	Health.Value:Hide()
	local HealthCurrent = Health:CreateFontString(nil, "OVERLAY")
	HealthCurrent:SetParent(Health)
	HealthCurrent:SetPoint("RIGHT", Health, "RIGHT", -4, 0)
	HealthCurrent:SetFontObject(Font)
	HealthCurrent:SetJustifyH("LEFT")
	self:Tag(HealthCurrent, "[Tukui:GetNameColor][curhp]")
	
	Health:SetStatusBarColor(.15, .15, .15)
	Health.Background:SetColorTexture(.05, .05, .05)
	
	Health.colorClass = false
	Health.colorReaction = false
	Health.colorTapping = false
	Health.colorDisconnected = false

	Power:ClearAllPoints()
	Power:Point("TOPLEFT", Health, "BOTTOMLEFT", 4, 1)
	Power:SetHeight(3)
	Power:SetWidth(90)
	Power:SetFrameLevel(10)
	Power:CreateBackdrop("Default")
	Power.Background:Hide()
	
	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:Point("LEFT", Health, "LEFT", 4, 0)
	self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level]|r [shortclassification]")

	Castbar:SetSize(280, 12)
	Castbar:ClearAllPoints()
	Castbar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 400)
	Castbar:CreateBackdrop("Transparent")
	Castbar.Background:Hide()
	
	Castbar.Time:ClearAllPoints()
	Castbar.Time:Point("RIGHT", Castbar, "RIGHT", -4, 1)
	Castbar.Time:SetJustifyH("RIGHT")

	Castbar.Text:ClearAllPoints()
	Castbar.Text:Point("LEFT", Castbar, "LEFT", 4, 1)
	Castbar.Text:Size(160, 10)
	
	if (C["UnitFrames"]["TargetAuras"]) then
		if C["PatUI"]["ThickBorders"] == true then
			Buffs.spacing = 4
			Debuffs.spacing = 4
			Buffs:ClearAllPoints()
			Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -1, 3)
		else
			Buffs.spacing = 1
			Debuffs.spacing = 1
			Buffs:ClearAllPoints()
			Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -1, 1)		
		end
		Buffs:SetHeight(27)
		Buffs:SetWidth(260)
		Buffs.size = 24
		Buffs.num = 9
		Buffs.initialAnchor = 'TOPLEFT'
		Buffs["growth-y"] = "UP"
		Buffs["growth-x"] = "RIGHT"
		Buffs:SetParent(Health)
		Buffs.PostCreateIcon = UnitFrames.PostCreateAura
		Buffs.PostUpdateIcon = UnitFrames.PostUpdateAura
		Buffs.PostUpdate = UnitFrames.UpdateBuffsHeaderPosition
		
		Debuffs:SetHeight(29)
		Debuffs:SetWidth(240)
		Debuffs.size = 27
		Debuffs.num = 16
		Debuffs.initialAnchor = 'TOPRIGHT'
		Debuffs["growth-y"] = "UP"
		Debuffs["growth-x"] = "LEFT"
		Debuffs:ClearAllPoints()
		Debuffs:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", 0, 35)
		Debuffs:SetParent(Health)
		Debuffs.PostCreateIcon = UnitFrames.PostCreateAura
		Debuffs.PostUpdateIcon = UnitFrames.PostUpdateAura
		
		Buffs.ClearAllPoints = T.dummy
		Debuffs.ClearAllPoints = T.dummy
	end
	
	if C["UnitFrames"]["Portrait"] == true then
		Portrait:Size(40, 40)
		Portrait:ClearAllPoints()
		Portrait:Point("LEFT", Health, "RIGHT", 8, 9)
			
		Health:ClearAllPoints()
		Health:SetAllPoints(self)
		if C["PatUI"]["ThickBorders"] == true then			
			local portraitbg = CreateFrame("Frame", nil, self)
			portraitbg:SetFrameLevel(Portrait:GetFrameLevel())
			portraitbg:SetFrameStrata(Portrait:GetFrameStrata())
			portraitbg:Size(46, 45)
			portraitbg:Point("CENTER", Portrait, "CENTER", 0, 0)
			portraitbg:PatUI()
			portraitbg:CreateShadow()
			
			Health:ClearAllPoints()
			Health:SetAllPoints(self)
		end
	end
	
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
		
		local castbg = CreateFrame("Frame", nil, Castbar)
		castbg:PatUI("Transparent")
		castbg:Size(1, 1)
		castbg:Point("TOPLEFT", Castbar, -2, 2)
		castbg:Point("BOTTOMRIGHT", Castbar, 2, -2)
		castbg:SetFrameLevel(Castbar:GetFrameLevel() - 1)
		castbg:CreateShadow()
	else
		Health:CreateShadow()
		Power:CreateShadow()
		Castbar:CreateShadow()
	end
end