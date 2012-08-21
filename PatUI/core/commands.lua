local T, C, L = unpack(Tukui)

-- switch to heal layout via a command
SLASH_PATUIHEAL1 = "/pheal"
SlashCmdList.PATUIHEAL = function()
	DisableAddOn("PatUI_Raid")
	EnableAddOn("PatUI_Raid_Healing")
	ReloadUI()
end

-- switch to dps layout via a command
SLASH_PATUIDPS1 = "/pdps"
SlashCmdList.PATUIDPS = function()
	DisableAddOn("PatUI_Raid_Healing")
	EnableAddOn("PatUI_Raid")
	ReloadUI()
end