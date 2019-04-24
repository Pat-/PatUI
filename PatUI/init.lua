local T, C, L = Tukui:unpack()

local Chat = T["Chat"]
local Datatext = T["DataTexts"]

local init = CreateFrame("Frame")
init:RegisterEvent("PLAYER_ENTERING_WORLD")
init:SetScript("OnEvent", function(self, event)
	
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

	local configVersion = PatUICharData["Version"]
	local addonVersion = GetAddOnMetadata("PatUI", "Version")

	if (configVersion ~= addonVersion) then
		-- First time doing compatibility check
		if (configVersion == nil) then
			
			StaticPopup_Show("NEWVERSION")
		
		end
		PatUICharData["Version"] = GetAddOnMetadata("PatUI", "Version")
	end
end)

StaticPopupDialogs["NEWVERSION"] = {
	text = "|cff18AA18Older version detected, chatframes neeed to be updated|r",
	button1 = "|cff18AA18Update Chats|r",
	OnAccept = function() Chat:Install() Chat:SetDefaultChatFramesPositions() Datatext:Reset() ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}