local T, C, L = Tukui:unpack()
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

------------------------------------------------------------------------------------------
-- in game configuration base settings (standard Tukui)
------------------------------------------------------------------------------------------

-- General
	--C["General"]["BackdropColor"] = {class.r*0.06, class.g*0.06, class.b*0.06}
	--C["General"]["BorderColor"] = {class.r*0.03, class.g*0.03, class.b*0.03}
	C["General"]["HideShadows"] = false
	C["General"]["Scaling"]["Value"] = "Pixel Perfection"
	C["General"]["AFKSaver"] = false

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
	C["ActionBars"]["Font"] = "Pixel"

-- Auras
	C["Auras"]["Enable"] = true
	C["Auras"]["Flash"] = false
	C["Auras"]["ClassicTimer"] = false
	C["Auras"]["HideBuffs"] = false
	C["Auras"]["HideDebuffs"] = false
	C["Auras"]["Animation"] = false
	C["Auras"]["BuffsPerRow"] = 12
	C["Auras"]["Font"] = "Pixel"

-- Bags
	C["Bags"]["Enable"] = true
	C["Bags"]["ButtonSize"] = 28
	C["Bags"]["Spacing"] = 4
	C["Bags"]["ItemsPerRow"] = 11
	C["Bags"]["PulseNewItem"] = false
	C["Bags"]["Font"] = "Pixel"

-- Chat	
	C["Chat"]["Enable"] = true
	C["Chat"]["WhisperSound"] = true
	C["Chat"]["LinkColor"] = {0.08, 1, 0.36}
	C["Chat"]["LinkBrackets"] = true
	C["Chat"]["ScrollByX"] = 3
	C["Chat"]["TabFont"] = "Pixel"
	C["Chat"]["ChatFont"] = "Tukui"
	
-- Cooldowns
	C["Cooldowns"]["Font"] = "Pixel"

-- Datatexts	
	C["DataTexts"]["Battleground"] = false
	C["DataTexts"]["LocalTime"] = true
	C["DataTexts"]["Time24HrFormat"] = false
	C["DataTexts"]["NameColor"] = {class.r, class.g, class.b}
	C["DataTexts"]["ValueColor"] = {1, 1, 1}
	C["DataTexts"]["Font"] = "Pixel"

-- Loot
	C["Loot"]["Enable"] = true
	C["Loot"]["StandardLoot"] = false
	C["Loot"]["Font"] = "Pixel"

-- Merchant	
	C["Merchant"]["AutoSellGrays"] = true
	C["Merchant"]["AutoRepair"] = true
	C["Merchant"]["UseGuildRepair"] = false

-- Misc
	C["Misc"]["ThreatBarEnable"] = true
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
	C["NamePlates"]["Font"] = "Pixel"

-- Party	
	C["Party"]["Enable"] = false
	C["Party"]["HealBar"] = true
	C["Party"]["ShowPlayer"] = true
	C["Party"]["ShowHealthText"] = true
	C["Party"]["RangeAlpha"] = 0.3
	C["Party"]["Font"] = "Pixel"
	C["Party"]["HealthFont"] = "Pixel"

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
	C["Raid"]["Font"] = "Pixel"
	C["Raid"]["HealthFont"] = "Pixel"
	C["Raid"]["GroupBy"]["Value"] = "ROLE"
	C["Raid"]["HealthTexture"] = "Blank"
	C["Raid"]["PowerTexture"] = "Blank"

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
	C["Tooltips"]["HealthFont"] = "Pixel"
	
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
	C["UnitFrames"]["Font"] = "Pixel"
