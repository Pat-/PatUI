local P, C, L, G = unpack(Tukui)

local PatUIOnLogon = CreateFrame("Frame")
PatUIOnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
PatUIOnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	
	if (IsAddOnLoaded("PatUI_DPS") and IsAddOnLoaded("PatUI_Healing")) then
		StaticPopup_Show("PATUIDISABLE_RAID")
	end
end)

StaticPopupDialogs["PATUIDISABLE_RAID"] = {
	text = "|cff18AA18Choose Raid Frame Style|r",
	button1 = "|cff18AA18DPS - Tank|r",
	button2 = "|cff18AA18Heal|r",
	OnAccept = function() DisableAddOn("PatUI_Healing") EnableAddOn("PatUI_DPS") ReloadUI() end,
	OnCancel = function() EnableAddOn("PatUI_Healing") DisableAddOn("PatUI_DPS") ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}
