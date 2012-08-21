local T, C, L = unpack(Tukui)

local Kill = CreateFrame("Frame")
Kill:RegisterEvent("ADDON_LOADED")
Kill:SetScript("OnEvent", function(self, event, addon)
	if addon == "PatUI_Raid" or addon == "PatUI_Raid_Healing" then
		CompactRaidFrameManager:SetScale(0.000001)
		CompactRaidFrameContainer:SetScale(0.000001)		
	end
end)