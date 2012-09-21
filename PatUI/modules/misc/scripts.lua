local P, C, L, G = unpack(Tukui)

-----------------------------------------------------
-- Scripts for our control panel buttons are set here
-----------------------------------------------------

chat_Button:SetScript("OnMouseDown", function(self)
	local db = PatUIDataPerChar
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	if ChatBackground:IsShown() then
			ChatBackground:Hide()
			if C.chat.lootchat then
				ChatBackground2:Hide()
			end
			db.hidechat = true
	else
		if not ChatBackground:IsShown() then
			ChatBackground:Show()
			if C.chat.lootchat then
				ChatBackground2:Show()
			end
			db.hidechat = false
		end 
	end
end)

Minimap_Button:SetScript("OnMouseDown", function(self)
	local db = PatUIDataPerChar
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	if TukuiMinimap:IsShown() then
			TukuiMinimap:Hide()
			if P.level ~= MAX_PLAYER_LEVEL then
				TukuiPlayer.Experience:SetAlpha(0)
			end
			TukuiAurasPlayerBuffs:ClearAllPoints()
			TukuiAurasPlayerBuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -3, -2)
			db.hideminimap = true
	else
		if not TukuiMinimap:IsShown() then
			TukuiMinimap:Show()
			if P.level ~= MAX_PLAYER_LEVEL then
				TukuiPlayer.Experience:SetAlpha(1)
			end
			TukuiAurasPlayerBuffs:ClearAllPoints()
			TukuiAurasPlayerBuffs:SetPoint("TOPRIGHT", TukuiMinimap, "TOPLEFT", -18, 0)
			db.hideminimap = false
		end 
	end
end)

-----------------------------------------------------------
-- Used to make sure things stay hidden on reload and relog
-----------------------------------------------------------
local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	if not PatUIDataPerChar then PatUIDataPerChar = {} end
	local db = PatUIDataPerChar
	
	if db.hideminimap then
		TukuiMinimap:Hide()
		if P.level ~= MAX_PLAYER_LEVEL then
			TukuiPlayer.Experience:SetAlpha(0)
		end
		TukuiAurasPlayerBuffs:ClearAllPoints()
		TukuiAurasPlayerBuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -3, -2)
	end
	
	if db.hidechat then
		ChatBackground:Hide()
		if C.chat.lootchat then
			ChatBackground2:Hide()
		end
	end
end)
