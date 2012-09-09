local P, C, L, G = unpack(Tukui)

-- switch to heal layout via a command
SLASH_PATUIHEAL1 = "/heal"
SlashCmdList.PATUIHEAL = function()
	DisableAddOn("PatUI_DPS")
	EnableAddOn("PatUI_Healing")
	ReloadUI()
end

-- switch to dps layout via a command
SLASH_PATUIDPS1 = "/dps"
SlashCmdList.PATUIDPS = function()
	DisableAddOn("PatUI_Healing")
	EnableAddOn("PatUI_DPS")
	ReloadUI()
end