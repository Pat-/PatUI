local T, C, L = Tukui:unpack()
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

-- Creating our own section of the Tukui Config
C["PatUI"] = {
	["Healer"] = false,
	["RepExpMouseOver"] = true,
	["SplitBar5"] = true,
	["HideRight"] = false,
}

-- General
C["General"]["HideShadows"] = false
C["General"]["WorldMapScale"] = 100

-- Actionbars	
C["ActionBars"]["Enable"] = true
C["ActionBars"]["HotKey"] = false
C["ActionBars"]["EquipBorder"] = true
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
C["Bags"]["Font"] = "PatUI"

-- Chat	
C["Chat"]["Enable"] = true
C["Chat"]["WhisperSound"] = true
C["Chat"]["LinkColor"] = {0.08, 1, 0.36}
C["Chat"]["LinkBrackets"] = true
C["Chat"]["ScrollByX"] = 3
C["Chat"]["TabFont"] = "PatUI"
C["Chat"]["ChatFont"] = "Tukui"
C["Chat"]["LeftWidth"] = 370
C["Chat"]["LeftHeight"] = 113
C["Chat"]["RightWidth"] = 370
C["Chat"]["RightHeight"] = 113

-- Cooldowns
C["Cooldowns"]["Font"] = "PatUI"

-- Datatexts	
C["DataTexts"]["Battleground"] = false
C["DataTexts"]["Hour24"] = false
C["DataTexts"]["NameColor"] = {class.r, class.g, class.b}
C["DataTexts"]["ValueColor"] = {1, 1, 1}
C["DataTexts"]["Font"] = "PatUI"

-- Loot
C["Loot"]["Enable"] = true
C["Loot"]["StandardLoot"] = false
C["Loot"]["Font"] = "PatUI"

-- Misc
C["Misc"]["ExperienceEnable"] = true
C["Misc"]["ReputationEnable"] = true
C["Misc"]["ErrorFilterEnable"] = true
C["Misc"]["AFKSaver"] = false

-- Nameplates	
C["NamePlates"]["Enable"] = true
C["NamePlates"]["Width"] = 140
C["NamePlates"]["Height"] = 8
C["NamePlates"]["Font"] = "PatUI"
C["NamePlates"]["OnlySelfDebuffs"] = false

-- Party	
C["Party"]["Enable"] = false

-- Raid	
C["Raid"]["Enable"] = true
C["Raid"]["DebuffWatch"] = false
C["Raid"]["ShowHealthText"] = false
C["Raid"]["ShowPets"] = false
C["Raid"]["RangeAlpha"] = 0.3
C["Raid"]["VerticalHealth"] = false
C["Raid"]["MaxUnitPerColumn"] = 5
C["Raid"]["Font"] = "PatUI"
C["Raid"]["HealthFont"] = "PatUI"
C["Raid"]["MyRaidBuffs"] = false
C["Raid"]["GroupBy"]["Value"] = "ROLE"
C["Raid"]["ShowSolo"] = false

-- Tooltip		
C["Tooltips"]["Enable"] = true
C["Tooltips"]["HideOnUnitFrames"] = false
C["Tooltips"]["HideInCombat"] = false
C["Tooltips"]["UnitHealthText"] = true
C["Tooltips"]["MouseOver"] = false
C["Tooltips"]["HealthFont"] = "PatUI"

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

-- Unitframes	
C["UnitFrames"]["Enable"] = true
C["UnitFrames"]["Portrait"] = false
C["UnitFrames"]["CastBar"] = true
C["UnitFrames"]["ComboBar"] = true
C["UnitFrames"]["CastBarIcon"] = false
C["UnitFrames"]["CastBarLatency"] = true
C["UnitFrames"]["Smooth"] = true
C["UnitFrames"]["TargetEnemyHostileColor"] = false
C["UnitFrames"]["CombatLog"] = true
C["UnitFrames"]["PlayerAuras"] = false
C["UnitFrames"]["TargetAuras"] = true
C["UnitFrames"]["OnlySelfDebuffs"] = false
C["UnitFrames"]["OnlySelfBuffs"] = false
C["UnitFrames"]["Font"] = "PatUI"
