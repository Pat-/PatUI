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
		"initial-width", PatBar3:GetWidth()/5 - 3.6,
		"initial-height", 27,
		"showParty", true,
		"showRaid", true,
		"showPlayer", true,
		"showSolo", C["Raid"]["ShowSolo"],
		"xoffset", T.Scale(4),
		"yOffset", T.Scale(-4),
		"point", "LEFT",
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"maxColumns", math.ceil(40/5),
		"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
		"columnSpacing", T.Scale(4),
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
	elseif C["PatUI"]["SmallerChat"] == true then
		Raid:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 0, 5)
	else
		Raid:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 0, 14)
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
	local ResurrectIcon = self.ResurrectIndicator
	local Atonement = self.Atonement
	local RaidDebuffs = self.RaidDebuffs
	
	local IsInGroup = IsInGroup
	local UnitIsUnit = UnitIsUnit
	local raidscale = 1
		
		self.Shadow:Kill()
		
		-- health
		Health:CreateBackdrop("Default")
		Health:CreateShadow()
		
		Health:SetStatusBarColor(.2, .2, .2)
		Health.Background:SetColorTexture(.1, .1, .1)
		
		Health.colorTapping = false		
		Health.colorDisconnected = false
		Health.colorClass = false
		Health.colorReaction = false
		
		-- Power	
		Power:ClearAllPoints()

		-- Name	
		Name:ClearAllPoints()
		Name:SetPoint("CENTER", Health, "CENTER", 0, 0)
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
		
		-- resurrect Icon
		ResurrectIcon:Size(24)
		ResurrectIcon:SetPoint("TOP")
		
		if C["Raid"]["RoleIcons"] == true then
			-- set our own role icons :D
			local LFDRole = self.Health:CreateTexture(nil, "OVERLAY")
			LFDRole:Height(15*raidscale)
			LFDRole:Width(15*raidscale)
			LFDRole:Point("TOPLEFT", 1, -1)
			LFDRole.Override = T.RoleIconUpdate
			self:RegisterEvent("UNIT_CONNECTION", T.RoleIconUpdate)
			self.LFDRole = LFDRole
		end
		
	-- AuraWatch (corner and center icon)
	if C["Raid"].AuraWatch then
		RaidDebuffs:ClearAllPoints()
		RaidDebuffs:SetHeight(15)
		RaidDebuffs:SetWidth(15)
		RaidDebuffs:SetPoint("CENTER", Health)
	end
end

local PatUIRaidPosition = CreateFrame("Frame")
PatUIRaidPosition:RegisterEvent("PLAYER_LOGIN")
PatUIRaidPosition:SetScript("OnEvent", function(self, event)
	if C["PatUI"]["Healer"] == true then return end
	
	local raid = UnitFrames.Headers.Raid
	local LeftChatBG = Panels.LeftChatBG
	
	if PatBar3:IsShown() then
		raid:SetPoint("BOTTOMLEFT", PatBar3, "TOPLEFT", 1, 3)
	end
	
	PatBar3:HookScript("OnHide", function()
		raid:ClearAllPoints()
		if C["PatUI"]["SmallerChat"] == true then
			raid:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 0, 5)
		else
			raid:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 0, 14)
		end
	end)
	
	PatBar3:HookScript("OnShow", function()
		raid:ClearAllPoints()
		raid:SetPoint("BOTTOMLEFT", PatBar3, "TOPLEFT", 1, 3)
	end)
end)