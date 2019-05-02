local T, C, L = Tukui:unpack()

local SmallerChat = {
	["Name"] = "|cffFFFF99Smaller Chat|r",
	["Desc"] = "lowers the default chatframe heights will require a /tukui install to readjust chat window heights",
}
TukuiConfig.enUS["General"]["SmallerChat"] = SmallerChat

local Healer = {
	["Name"] = "|cffFFFF99Healer|r",
	["Desc"] = "Centers raid frame and adjusts positions of unitframes for a more healer friendly layout",
}
TukuiConfig.enUS["Raid"]["Healer"] = Healer

local ShowSolo = {
	["Name"] = "|cffFFFF99Show Solo|r",
	["Desc"] = "Shows Raid/Party frame while solo",
}
TukuiConfig.enUS["Raid"]["ShowSolo"] = ShowSolo

local RoleIcons = {
	["Name"] = "|cffFFFF99Role Icons|r",
	["Desc"] = "Show/Hide role icons on raid/party frames",
}
TukuiConfig.enUS["Raid"]["RoleIcons"] = RoleIcons

local CombatHide = {
	["Name"] = "|cffFFFF99Combat Hide|r",
	["Desc"] = "Hides tooltip when in combat",
}
TukuiConfig.enUS["Tooltips"]["CombatHide"] = CombatHide

local HideTarget = {
	["Name"] = "|cffFFFF99Hide Target|r",
	["Desc"] = "Hides target info on tooltip (Experimental and buggy)",
}
TukuiConfig.enUS["Tooltips"]["HideTarget"] = HideTarget