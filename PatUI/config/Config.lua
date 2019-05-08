local T, C, L = Tukui:unpack()
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

------------------------------------------------------------------------------------------
-- in game configuration base settings (standard Tukui)
------------------------------------------------------------------------------------------

-- Creating our own section of the Tukui Config
	C["PatUI"] = {
		["SmallerChat"] = true,
		["ShowSolo"] = false,
		["Healer"] = false,
		["RoleIcons"] = true,
		["CombatHide"] = false,
		["HideTarget"] = true,
		["RepExpMouseOver"] = true,
		
	}

-- General
	C["General"]["HideShadows"] = false
	C["General"]["Scaling"]["Value"] = "Pixel Perfection"
	C["General"]["AFKSaver"] = false
	C["General"]["SmallerChat"] = true

-- Actionbars	
	C["ActionBars"]["Enable"] = true
	C["ActionBars"]["HotKey"] = false
	C["ActionBars"]["Macro"] = true
	C["ActionBars"]["ShapeShift"] = false
	C["ActionBars"]["Pet"] = true
	C["ActionBars"]["SwitchBarOnStance"] = true
	C["ActionBars"]["NormalButtonSize"] = 26
	C["ActionBars"]["PetButtonSize"] = 25
	C["ActionBars"]["ButtonSpacing"] = 4
	C["ActionBars"]["HideBackdrop"] = false
	C["ActionBars"]["Font"] = "PatUI"

-- Auras
	C["Auras"]["Enable"] = true
	C["Auras"]["Flash"] = false
	C["Auras"]["ClassicTimer"] = false
	C["Auras"]["HideBuffs"] = false
	C["Auras"]["HideDebuffs"] = false
	C["Auras"]["Animation"] = false
	C["Auras"]["BuffsPerRow"] = 12
	C["Auras"]["Font"] = "PatUI"

-- Bags
	C["Bags"]["Enable"] = true
	C["Bags"]["ButtonSize"] = 28
	C["Bags"]["Spacing"] = 4
	C["Bags"]["ItemsPerRow"] = 11
	C["Bags"]["PulseNewItem"] = false
	C["Bags"]["Font"] = "PatUI"

-- Chat	
	C["Chat"]["Enable"] = true
	C["Chat"]["WhisperSound"] = true
	C["Chat"]["LinkColor"] = {0.08, 1, 0.36}
	C["Chat"]["LinkBrackets"] = true
	C["Chat"]["ScrollByX"] = 3
	C["Chat"]["TabFont"] = "PatUI"
	C["Chat"]["ChatFont"] = "Tukui"
	
-- Cooldowns
	C["Cooldowns"]["Font"] = "PatUI"

-- Datatexts	
	C["DataTexts"]["Battleground"] = false
	C["DataTexts"]["LocalTime"] = true
	C["DataTexts"]["Time24HrFormat"] = false
	C["DataTexts"]["NameColor"] = {class.r, class.g, class.b}
	C["DataTexts"]["ValueColor"] = {1, 1, 1}
	C["DataTexts"]["Font"] = "PatUI"

-- Loot
	C["Loot"]["Enable"] = true
	C["Loot"]["StandardLoot"] = false
	C["Loot"]["Font"] = "PatUI"

-- Merchant	
	C["Merchant"]["AutoSellGrays"] = true
	C["Merchant"]["AutoRepair"] = true
	C["Merchant"]["UseGuildRepair"] = false

-- Misc
	C["Misc"]["ThreatBarEnable"] = false
	C["Misc"]["AltPowerBarEnable"] = true
	C["Misc"]["ExperienceEnable"] = true
	C["Misc"]["ReputationEnable"] = true
	C["Misc"]["ErrorFilterEnable"] = true
	C["Misc"]["AutoInviteEnable"] = false
	C["Misc"]["TalkingHeadEnable"] = true

-- Nameplates	
	C["NamePlates"]["Enable"] = true
	C["NamePlates"]["Width"] = 140
	C["NamePlates"]["Height"] = 8
	C["NamePlates"]["CastHeight"] = 1
	C["NamePlates"]["Font"] = "PatUI"

-- Party	
	C["Party"]["Enable"] = false

-- Raid	
	C["Raid"]["Enable"] = true
	C["Raid"]["HealBar"] = false
	C["Raid"]["AuraWatch"] = false
	C["Raid"]["AuraWatchTimers"] = false
	C["Raid"]["DebuffWatch"] = true
	C["Raid"]["RangeAlpha"] = 0.3
	C["Raid"]["ShowRessurection"] = true
	C["Raid"]["ShowHealthText"] = false
	C["Raid"]["ShowPets"] = false
	C["Raid"]["VerticalHealth"] = false
	C["Raid"]["MaxUnitPerColumn"] = 5
	C["Raid"]["Font"] = "PatUI"
	C["Raid"]["HealthFont"] = "PatUI"
	C["Raid"]["GroupBy"]["Value"] = "ROLE"
	C["Raid"]["HealthTexture"] = "Blank"
	C["Raid"]["PowerTexture"] = "Blank"
	C["Raid"]["ShowSolo"] = false
	C["Raid"]["Healer"] = false
	C["Raid"]["RoleIcons"] = true

-- Textures
	C["Textures"]["QuestProgressTexture"] = "Blank"
	C["Textures"]["TTHealthTexture"] = "Blank"
	C["Textures"]["UFPowerTexture"] = "Blank"
	C["Textures"]["UFHealthTexture"] = "Blank"
	C["Textures"]["UFCastTexture"] = "Blank"
	C["Textures"]["UFPartyPowerTexture"] = "Blank"
	C["Textures"]["UFPartyHealthTexture"] = "Blank"
	C["Textures"]["UFRaidPowerTexture"] = "Blank"
	C["Textures"]["UFRaidHealthTexture"] = "Blank"
	C["Textures"]["NPHealthTexture"] = "Blank"
	C["Textures"]["NPPowerTexture"] = "Blank"
	C["Textures"]["NPCastTexture"] = "Blank"

-- Tooltip		
	C["Tooltips"]["Enable"] = true
	C["Tooltips"]["HideOnUnitFrames"] = false
	C["Tooltips"]["UnitHealthText"] = true
	C["Tooltips"]["ShowSpec"] = false
	C["Tooltips"]["MouseOver"] = false
	C["Tooltips"]["HealthFont"] = "PatUI"
	C["Tooltips"]["CombatHide"] = false
	C["Tooltips"]["HideTarget"] = false
	
-- Unitframes	
	C["UnitFrames"]["Enable"] = true
	C["UnitFrames"]["Portrait"] = false
	C["UnitFrames"]["CastBar"] = true
	C["UnitFrames"]["ComboBar"] = true
	C["UnitFrames"]["UnlinkCastBar"] = true
	C["UnitFrames"]["CastBarIcon"] = false
	C["UnitFrames"]["CastBarLatency"] = true
	C["UnitFrames"]["Smooth"] = true
	C["UnitFrames"]["TargetEnemyHostileColor"] = false
	C["UnitFrames"]["CombatLog"] = true
	C["UnitFrames"]["HealBar"] = true
	C["UnitFrames"]["TotemBar"] = true
	C["UnitFrames"]["TargetAuras"] = true
	C["UnitFrames"]["FocusAuras"] = true
	C["UnitFrames"]["FocusTargetAuras"] = false
	C["UnitFrames"]["ArenaAuras"] = false
	C["UnitFrames"]["BossAuras"] = true
	C["UnitFrames"]["OnlySelfDebuffs"] = false
	C["UnitFrames"]["OnlySelfBuffs"] = false
	C["UnitFrames"]["Threat"] = true
	C["UnitFrames"]["AltPowerText"] = true
	C["UnitFrames"]["Arena"] = true
	C["UnitFrames"]["Boss"] = true
	C["UnitFrames"]["Font"] = "PatUI"
