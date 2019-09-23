local T, C, L = Tukui:unpack()

local classcolor = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local UnitFrames = T["UnitFrames"]
local Panels = T["Panels"]
local Class = select(2, UnitClass("player"))

if C["PatUI"]["ThickBorders"] == true then
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
			"initial-width", 70,
			"initial-height", 27,
			"showParty", true,
			"showRaid", true,
			"showPlayer", true,
			"showSolo", false,
			"xoffset", 7,
			"yOffset", -7,
			"point", "LEFT",
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", "GROUP",
			"maxColumns", math.ceil(40/5),
			"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
			"columnSpacing", 4,
			"columnAnchorPoint", "BOTTOM"
	end
else
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
			"initial-width", 73.7,
			"initial-height", 27,
			"showParty", true,
			"showRaid", true,
			"showPlayer", true,
			"showSolo", false,
			"xoffset", 3,
			"yOffset", -3,
			"point", "LEFT",
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", "GROUP",
			"maxColumns", math.ceil(40/5),
			"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
			"columnSpacing", 4,
			"columnAnchorPoint", "BOTTOM"
	end
end

local baseCreateUnits = UnitFrames.CreateUnits
local baseRaid = UnitFrames.Raid

function UnitFrames:CreateUnits()
	-- Call the base function first
	baseCreateUnits(self)
	
	-- Then my stuff
	local Raid = UnitFrames.Headers.Raid
	local LeftChatBG = Panels.LeftChatBG
	
	-- Setting default points of raidframes based on what config setting is enabled or not
	Raid:ClearAllPoints()
	if C["PatUI"]["Healer"] == true then
		Raid:SetPoint("BOTTOM", PatBar1, "TOP", 0, 32)
	elseif C["PatUI"]["ThickBorders"] == true then
		Raid:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 2, 11)
	else
		Raid:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 1, 11)
	end
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
		
	self.Shadow:Kill()
	
	-- health
	Health:CreateBackdrop("Default")
	
	if C["PatUI"]["ThickBorders"] == true then
		local ufbg = CreateFrame("Frame", nil, self)
		ufbg:SetFrameLevel(Health:GetFrameLevel() - 1)
		ufbg:SetFrameStrata(Health:GetFrameStrata())
		ufbg:Point("TOPLEFT", Health, -2, 2)
		ufbg:Point("BOTTOMRIGHT", Health, 2, -2)
		ufbg:Size(1, 1)
		ufbg:PatUI()
		ufbg:CreateShadow()
	else
		Health:CreateShadow()
	end
	
	Health.Background:ClearAllPoints()
	Health.Background:SetAllPoints()
	
	Health.colorTapping = false		
	Health.colorDisconnected = false
	Health.colorClass = false
	Health.colorReaction = false
	
	Health.PostUpdate = UnitFrames.PostUpdateHealth
	
	-- Power	
	Power:ClearAllPoints()

	-- Name	
	Name:ClearAllPoints()
	Name:SetPoint("CENTER", Health, "CENTER", 0, 10)
	Name:SetParent(Health)
	Name:SetFontObject(RaidFont)
	self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameShort]")

	local GroupNumber = Health:CreateFontString(nil, "OVERLAY")
	local unit = self.unit
	
	-- Ready check V	
	ReadyCheck:ClearAllPoints()
	ReadyCheck:Size(24)
	ReadyCheck:SetPoint("CENTER", Health, 0, 0)
	
	-- raidicon
	RaidIcon:ClearAllPoints()
	RaidIcon:Point("CENTER", self, "TOP", 20, 0)
end