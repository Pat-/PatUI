local T, C, L = unpack(Tukui)

local PatUIOnLogon = CreateFrame("Frame")
PatUIOnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
PatUIOnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	
	if (IsAddOnLoaded("PatUI_Raid") and IsAddOnLoaded("PatUI_Raid_Healing")) then
		StaticPopup_Show("TUKUIDISABLE_RAID")
	end
end)