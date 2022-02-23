local T, C, L = Tukui:unpack()
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local MyClass = select(2, UnitClass("player"))

------------------------------------------------------------------------------------------
-- in game configuration base settings (standard Tukui)
------------------------------------------------------------------------------------------

-- Creating our own section of the Tukui Config
C["PatUI"] = {
	["BorderColor"] = {.28, .28, .28},
}

-- General
	C["General"]["HideShadows"] = false
	C["General"]["WorldMapScale"] = 90
	C["General"]["BackdropColor"] = {0.11, 0.11, 0.11}
	C["General"]["BorderColor"] = {0, 0, 0}

-- Actionbars	
	C["ActionBars"]["Enable"] = true
	C["ActionBars"]["BottomLeftBar"] = true
	C["ActionBars"]["BottomRightBar"] = true
	C["ActionBars"]["RightBar"] = true
	C["ActionBars"]["LeftBar"] = false
	C["ActionBars"]["HotKey"] = true
	C["ActionBars"]["EquipBorder"] = true
	C["ActionBars"]["Macro"] = false
	C["ActionBars"]["ShapeShift"] = true
	C["ActionBars"]["Pet"] = true
	C["ActionBars"]["SwitchBarOnStance"] = true
	C["ActionBars"]["Bar1ButtonsPerRow"] = 10
	C["ActionBars"]["Bar2ButtonsPerRow"] = 12
	C["ActionBars"]["Bar3ButtonsPerRow"] = 12
	C["ActionBars"]["Bar4ButtonsPerRow"] = 1
	C["ActionBars"]["Bar5ButtonsPerRow"] = 6
	C["ActionBars"]["BarPetButtonsPerRow"] = 10
	C["ActionBars"]["NormalButtonSize"] = 23
	C["ActionBars"]["PetButtonSize"] = 24
	C["ActionBars"]["ButtonSpacing"] = 3
	C["ActionBars"]["HideBackdrop"] = false
	C["ActionBars"]["Font"] = "PatUI"

-- Auras
	C["Auras"]["Enable"] = true
	C["Auras"]["Flash"] = false
	C["Auras"]["ClassicTimer"] = true
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
	C["Chat"]["LeftWidth"] = 360
	C["Chat"]["LeftHeight"] = 109
	C["Chat"]["RightWidth"] = 360
	C["Chat"]["RightHeight"] = 109
	C["Chat"]["ScrollByX"] = 3
	C["Chat"]["TabFont"] = "PatUI"
	C["Chat"]["ChatFont"] = "Tukui"
	C["Chat"]["BubblesTextSize"] = 12
	C["Chat"]["LogMax"] = 0
	
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

-- Misc
	C["Misc"]["ThreatBar"] = false
	C["Misc"]["WorldMapEnable"] = true
	C["Misc"]["ExperienceEnable"] = true
	C["Misc"]["AutoSellJunk"] = true
	C["Misc"]["AutoRepair"] = true
	C["Misc"]["AFKSaver"] = false
	C["Misc"]["TalkingHeadEnable"] = true

-- Nameplates	
	C["NamePlates"]["Enable"] = true
	C["NamePlates"]["Width"] = 140
	C["NamePlates"]["Height"] = 8
	C["NamePlates"]["CastHeight"] = 1
	C["NamePlates"]["Font"] = "PatUI"
	C["NamePlates"]["NameplateCastBar"] = false
	C["NamePlates"]["ClassIcon"] = false

-- Party	
	C["Party"]["Enable"] = false

-- Raid	
	C["Raid"]["Enable"] = true
	C["Raid"]["HealBar"] = false
	C["Raid"]["AuraWatch"] = false
	C["Raid"]["AuraWatchTimers"] = false
	C["Raid"]["DebuffWatch"] = false
	C["Raid"]["DebuffWatchDefault"] = false
	C["Raid"]["RangeAlpha"] = 0.3
	C["Raid"]["ShowRessurection"] = true
	C["Raid"]["ShowHealthText"] = false
	C["Raid"]["ShowPets"] = false
	C["Raid"]["VerticalHealth"] = false
	C["Raid"]["MaxUnitPerColumn"] = 5
	C["Raid"]["Font"] = "PatUI"
	C["Raid"]["HealthFont"] = "PatUI"
	C["Raid"]["GroupBy"]["Value"] = "ROLE"
	C["Raid"]["HealthTexture"] = "PatUI"
	C["Raid"]["PowerTexture"] = "PatUI"
	C["Raid"]["ShowSolo"] = false
	C["Raid"]["WidthSize"] = 43
	C["Raid"]["HeightSize"] = 15

-- Textures
	C["Textures"]["QuestProgressTexture"] = "PatUI"
	C["Textures"]["TTHealthTexture"] = "PatUI"
	C["Textures"]["UFPowerTexture"] = "PatUI"
	C["Textures"]["UFHealthTexture"] = "PatUI"
	C["Textures"]["UFCastTexture"] = "PatUI"
	C["Textures"]["UFPartyPowerTexture"] = "PatUI"
	C["Textures"]["UFPartyHealthTexture"] = "PatUI"
	C["Textures"]["UFRaidPowerTexture"] = "PatUI"
	C["Textures"]["UFRaidHealthTexture"] = "PatUI"
	C["Textures"]["NPHealthTexture"] = "PatUI"
	C["Textures"]["NPPowerTexture"] = "PatUI"
	C["Textures"]["NPCastTexture"] = "PatUI"

-- Tooltip		
	C["Tooltips"]["Enable"] = true
	C["Tooltips"]["HideOnUnitFrames"] = false
	C["Tooltips"]["UnitHealthText"] = true
	C["Tooltips"]["ShowSpec"] = false
	C["Tooltips"]["MouseOver"] = false
	C["Tooltips"]["HealthFont"] = "PatUI"
	
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
	C["UnitFrames"]["TargetAuras"] = true
	C["UnitFrames"]["FocusAuras"] = true
	C["UnitFrames"]["FocusTargetAuras"] = false
	C["UnitFrames"]["ArenaAuras"] = false
	C["UnitFrames"]["BossAuras"] = true
	C["UnitFrames"]["OnlySelfDebuffs"] = false
	C["UnitFrames"]["OnlySelfBuffs"] = false
	C["UnitFrames"]["Threat"] = true
	C["UnitFrames"]["PlayerAuras"] = false
	C["UnitFrames"]["TOTAuras"] = false
	C["UnitFrames"]["PetAuras"] = false
	C["UnitFrames"]["Arena"] = true
	C["UnitFrames"]["Boss"] = true
	C["UnitFrames"]["Font"] = "PatUI"
	C["UnitFrames"]["PlayerBuffs"] = false
	C["UnitFrames"]["PlayerDebuffs"] = false

	if MyClass == "SHAMAN" then
		C["UnitFrames"]["TotemBar"] = true
	end
