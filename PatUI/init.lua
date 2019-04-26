local T, C, L = Tukui:unpack()

local Chat = T["Chat"]
local Datatext = T["DataTexts"]

local init = CreateFrame("Frame")
init:RegisterEvent("ADDON_LOADED")
init:SetScript("OnEvent", function(self, event)
	
	-- Only do then when our addon is loaded
    if name ~= "PatUI" then return end
    
    -- We are done listen to ADDON_LOADED
    self:UnregisterEvent("ADDON_LOADED")

	local configVersion = PatUICharData["Version"]
	local addonVersion = GetAddOnMetadata("PatUI", "Version")

	if not configVersion then
		-- first time doing capatibility for version 0.2.2
		StaticPopup_Show("NEWVERSION")
	else
		-- do the regular compatability

		local major, minor, revision = configVersion:match("(%d+)%.(%d+)%.(%d+)")

		major = tonumber(major)
		minor = tonumber(minor)
		revision = tonumber(revision)

		if major <= 0 then
			if minor <= 3 then
				-- Do 0.3.X upgrade things here
				-- if revision < 1 then
				--     -- Do 0.3.1 upgrade here
				-- end
				-- if revision < 2 then
				--     -- Do 0.3.2 upgrade here
				-- end
			end
		end
	end

	-- After the upgrade, set the config version
	PatUICharData["Version"] = addonVersion
end)

StaticPopupDialogs["NEWVERSION"] = {
	text = "|cff18AA18Older version detected, chatframes neeed to be updated|r",
	button1 = "|cff18AA18Update Chats|r",
	OnAccept = function() Chat:Install() Chat:SetDefaultChatFramesPositions() Datatext:Reset() ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}