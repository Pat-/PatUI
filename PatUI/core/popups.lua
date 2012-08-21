local T, C, L = unpack(Tukui)

StaticPopupDialogs["TUKUIDISABLE_RAID"] = {
	text = "|cff18AA18Choose Raid Frame Style|r",
	button1 = "|cff18AA18DPS - Tank|r",
	button2 = "|cff18AA18Heal|r",
	OnAccept = function() DisableAddOn("PatUI_Raid_Healing") EnableAddOn("PatUI_Raid") ReloadUI() end,
	OnCancel = function() EnableAddOn("PatUI_Raid_Healing") DisableAddOn("PatUI_Raid") ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}