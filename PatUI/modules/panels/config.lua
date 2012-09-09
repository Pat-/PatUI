local P, C, L, G = unpack(Tukui)

local mmb = CreateFrame("Frame", "Minimap_Button", UIParent)
mmb:SetTemplate("Transparent")
mmb:Size(80, 20)
mmb:Point("LEFT", DataPoint1, "RIGHT", 4, 0)
mmb:SetFrameStrata("BACKGROUND")
mmb:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
mmb.Text:Point("CENTER", Minimap_Button)
mmb.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Hide Minimap")

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
end)

local cb = CreateFrame("Frame", "chat_Button", UIParent)
cb:SetTemplate("Transparent")
cb:Size(80, 20)
cb:Point("LEFT", Minimap_Button, "RIGHT", 4, 0)
cb:SetFrameStrata("BACKGROUND")
cb:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
cb.Text:Point("CENTER", chat_Button)
cb.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Hide Chat")

chat_Button:SetScript("OnMouseDown", function(self)
	local db = PatUIDataPerChar
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	if ChatBackground:IsShown() then
			ChatBackground:Hide()
			ChatBackground2:Hide()
			db.hidechat = true
	else
		if not ChatBackground:IsShown() then
			ChatBackground:Show()
			ChatBackground2:Show()
			db.hidechat = false
		end 
	end
end)


local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	if not PatUIDataPerChar then PatUIDataPerChar = {} end
	local db = PatUIDataPerChar
	
	if db.hidechat then
		ChatBackground:Hide()
		ChatBackground2:Hide()
	end
end)


local rlb = CreateFrame("Button", "Reload_Button", UIParent, "SecureActionButtonTemplate")
rlb:SetTemplate("Transparent")
rlb:Size(60, 20) 
rlb:Point("LEFT", chat_Button, "RIGHT", 4, 0)
rlb:SetAttribute("type", "macro")
rlb:SetAttribute("macrotext", "/rl")

rlb:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
rlb.Text:Point("CENTER", Reload_Button)
rlb.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Reload")