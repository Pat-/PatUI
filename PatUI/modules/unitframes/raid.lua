local T, C, L = Tukui:unpack()

local UnitFrames = T["UnitFrames"]

local baseRaid = UnitFrames.Raid

UnitFrames.ShortNameLength = 6

function UnitFrames:GetBigRaidFramesAttributes()
	local Properties = "custom [@raid21,exists] hide"

	return
		"TukuiRaid40",
		nil,
		Properties
end

function UnitFrames:GetRaidFramesAttributes()
	return
		"TukuiRaid", 
		nil, 
		"solo,party,raid",
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute("initial-width"))
			self:SetHeight(header:GetAttribute("initial-height"))
		]],
		"initial-width", C["Raid"]["WidthSize"],
		"initial-height", C["Raid"]["HeightSize"],
		"showParty", true,
		"showRaid", true,
		"showPlayer", true,
		"showSolo", C["Raid"]["ShowSolo"],
		"xoffset", 8,
		"yOffset", -10,
		"point", "LEFT",
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"maxColumns", math.ceil(40/5),
		"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
		"columnSpacing", 8,
		"columnAnchorPoint", "TOP"
end

function UnitFrames:Raid()
	-- Call the base function first
	baseRaid(self)
	
	-- Then my stuff
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local Name = self.Name
	local ReadyCheck = self.ReadyCheckIndicator
	local RaidIcon = self.RaidTargetIndicator
	local RaidDebuffs = self.RaidDebuffs
	local Buffs = self.Buffs
	local AuraTrack = self.AuraTrack
	
	local PowerTexture = T.GetTexture(C["Raid"]["PowerTexture"])
	local HealthTexture = T.GetTexture(C["Raid"]["HealthTexture"])
	local RaidFont = T.GetFont(C["Raid"].Font)
	local Blank = C.Medias.Blank
	local IsInGroup = IsInGroup
	local UnitIsUnit = UnitIsUnit

		self.Shadow:Kill()
		
		-- health
		Health:SetHeight(C["Raid"]["HeightSize"])

		Health:PatUI()
		Health.Backdrop:SetBackdropBorderColor(0, 0, 0)
		Health.Backdrop:SetOutside()
		Health.Backdrop:SetFrameStrata("BACKGROUND")

		Health:CreateThinShadow()
		Health.Shadow:SetOutside(Health.Backdrop, 6, 6)
		
		Health:SetStatusBarColor(.21, .2, .18)
		Health.Background:SetColorTexture(.38, .40, .40)

		Health.Value:ClearAllPoints()
		
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorTapping = false
		Health.colorDisconnected = false
		
		-- Power	
		Power:ClearAllPoints()

		-- Name	
		Name:ClearAllPoints()
		Name:SetPoint("CENTER", Health, "CENTER", 0, 1)
		
		-- Ready check V	
		ReadyCheck:ClearAllPoints()
		ReadyCheck:SetSize(24, 24)
		ReadyCheck:SetPoint("CENTER", Health, 0, 0)
		
		-- raidicon
		RaidIcon:ClearAllPoints()
		RaidIcon:SetPoint("CENTER", self, "TOP", 20, 0)

		self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameShort]")

	if C.Raid.AuraTrack then
			AuraTrack:ClearAllPoints()
			AuraTrack:SetPoint("TOPLEFT", Health, "TOPLEFT", -6, -2)
			AuraTrack:SetSize(60, 60)
	elseif C.Raid.RaidBuffs.Value ~= "Hide" then

		Buffs.initialAnchor = "BOTTOMRIGHT"

		Buffs.size = 23
		Buffs:SetHeight(23)
		Buffs:SetWidth(23)
	end

	self:HookScript("OnEnter", function(self)
		Health.Backdrop:SetBorderColor(Health:GetStatusBarColor())
	end)

	self:HookScript("OnLeave", function(self)
		Health.Backdrop:SetBorderColor(unpack(C["PatUI"]["BorderColor"]))
	end)

	-- AuraWatch (corner and center icon)
	if C.Raid.DebuffWatch then
		RaidDebuffs:ClearAllPoints()
		RaidDebuffs:SetHeight(15)
		RaidDebuffs:SetWidth(15)
		RaidDebuffs:SetPoint("CENTER", Health)
	end
end