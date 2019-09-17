local T, C, L = Tukui:unpack()

local classcolor = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local UnitFrames = T["UnitFrames"]
local Panels = T["Panels"]
local Class = select(2, UnitClass("player"))

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
		"initial-width", PatBar3:GetWidth()/4.73 - 3.6,
		"initial-height", 27,
		"showParty", true,
		"showRaid", true,
		"showPlayer", true,
		"showSolo", C["Raid"]["ShowSolo"],
		"xoffset", 4,
		"yOffset", -4,
		"point", "LEFT",
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"maxColumns", math.ceil(40/5),
		"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
		"columnSpacing", 4,
		"columnAnchorPoint", "BOTTOM"
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
	else
		Raid:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 0, 10)
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
	
	local IsInGroup = IsInGroup
	local UnitIsUnit = UnitIsUnit
	local raidscale = 1
		
	self.Shadow:Kill()
	
	-- health
	Health:CreateBackdrop("Default")
	Health:CreateShadow()
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:SetColorTexture(0.6, 0.6, 0.6)
	
	Health.colorTapping = false		
	Health.colorDisconnected = false
	Health.colorClass = false
	Health.colorReaction = false
	
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