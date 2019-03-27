local T, C, L = Tukui:unpack()

local classcolor = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local UnitFrames = T.UnitFrames
local Panels = T.Panels
local Class = select(2, UnitClass("player"))

------------------------------------------------------------------------------------------
-- RAID POSITION AND SIZE
------------------------------------------------------------------------------------------
local function CreateUnits()
	local Raid = UnitFrames.Headers.Raid
	local LeftChatBG = Panels.LeftChatBG
	
	Raid:ClearAllPoints()
	Raid:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 0, 14)
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- RAID FRAMES
------------------------------------------------------------------------------------------
local function Raid(self)
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local Name = self.Name
	local ReadyCheck = self.ReadyCheckIndicator
	local RaidIcon = self.RaidTargetIndicator
	local ResurrectIcon = self.ResurrectIndicator
	local Atonement = self.Atonement
	local RaidDebuffs = self.RaidDebuffs
	
	local PowerTexture = T.GetTexture(C["Raid"]["PowerTexture"])
	local HealthTexture = T.GetTexture(C["Raid"]["HealthTexture"])
	local RaidFont = T.GetFont(C["Raid"].Font)
	local Blank = C.Medias.Blank
	local IsInGroup = IsInGroup
	local UnitIsUnit = UnitIsUnit
	
------------------------------------------------------------------------------------------
-- health, power, name
------------------------------------------------------------------------------------------

		-- health
		Health:ClearAllPoints()
		Health:SetInside(self)
		Health:CreateBackdrop("Default")
		self:Height(27)
		self:Width(74)
		
		Health:SetStatusBarColor(.2, .2, .2)
		Health.Background:SetColorTexture(.1, .1, .1)
		
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

------------------------------------------------------------------------------------------
-- OTHER STUFF
------------------------------------------------------------------------------------------
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
		
------------------------------------------------------------------------------------------
-- Buff/Debuffs
------------------------------------------------------------------------------------------
	-- AuraWatch (corner and center icon)
	if C["Raid"].AuraWatch then
		RaidDebuffs:ClearAllPoints()
		RaidDebuffs:SetHeight(15)
		RaidDebuffs:SetWidth(15)
		RaidDebuffs:SetPoint("CENTER", Health)
	end
end
hooksecurefunc(UnitFrames, "Raid", Raid)

local PatUIRaidPosition = CreateFrame("Frame")
PatUIRaidPosition:RegisterEvent("PLAYER_LOGIN")
PatUIRaidPosition:SetScript("OnEvent", function(self, event)
	local raid = UnitFrames.Headers.Raid
	local LeftChatBG = Panels.LeftChatBG
	
	if PatBar3:IsShown() then
		raid:SetPoint("BOTTOMLEFT", PatBar3, "TOPLEFT", 0, 5)
	end
	
	PatBar3:HookScript("OnHide", function()
		raid:ClearAllPoints()
		raid:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 0, 14)
	end)
	
	PatBar3:HookScript("OnShow", function()
		raid:ClearAllPoints()
		raid:SetPoint("BOTTOMLEFT", PatBar3, "TOPLEFT", 0, 5)
	end)
end)