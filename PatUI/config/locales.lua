local T, C, L = Tukui:unpack()

-- Creating our own section of the Tukui Config
local PatUI = {
	["SmallerChat"] = {
		["Name"] = "|cffFFFF99Smaller Chat|r",
		["Desc"] = "lowers the default chatframe heights will require a /tukui install to readjust chat window heights",
	},

	["Healer"] = {
		["Name"] = "|cffFFFF99Healer|r",
		["Desc"] = "Centers raid frame and adjusts positions of unitframes for a more healer friendly layout",
	},

	["ShowSolo"] = {
		["Name"] = "|cffFFFF99Show Solo|r",
		["Desc"] = "Shows Raid/Party frame while solo",
	},

	["RoleIcons"] = {
		["Name"] = "|cffFFFF99Role Icons|r",
		["Desc"] = "Show/Hide role icons on raid/party frames",
	},

	["CombatHide"] = {
		["Name"] = "|cffFFFF99Combat Hide|r",
		["Desc"] = "Hides tooltip when in combat",
	},

	["HideTarget"] = {
		["Name"] = "|cffFFFF99Hide Target|r",
		["Desc"] = "Hides target info on tooltip (Experimental and buggy)",
	},
	["RepExpMouseOver"] = {
		["Name"] = "|cffFFFF99Mouseover Rep/Exp|r",
		["Desc"] = "Enable to make Rep/Exp bars hidden unless Mouseovered",
	},
}
TukuiConfig.enUS["PatUI"] = PatUI