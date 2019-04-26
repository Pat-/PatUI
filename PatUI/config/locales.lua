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