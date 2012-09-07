local P, C, L, G = unpack(Tukui)

TukuiMinimap:ClearAllPoints()
TukuiMinimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -3, -3)

local mmb = CreateFrame("Frame", "Minimap_Button", UIParent)
mmb:SetTemplate("Transparent")
mmb:Size(120, 20)
mmb:Point("TOPLEFT", ChatBackground, "BOTTOMLEFT", 0, -3)
mmb:SetFrameStrata("BACKGROUND")
mmb:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
mmb.Text:Point("CENTER", Minimap_Button)
mmb.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Hide Minimap")

Minimap_Button:SetScript("OnMouseDown", function(self)
	local db = PatUIDataPerChar
	
	if TukuiMinimap:IsShown() then
			TukuiMinimap:Hide()
			TukuiAurasPlayerBuffs:ClearAllPoints()
			TukuiAurasPlayerBuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -3, -2)
			db.hideminimap = true
	else
		if not TukuiMinimap:IsShown() then
			TukuiMinimap:Show()
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
		TukuiAurasPlayerBuffs:ClearAllPoints()
		TukuiAurasPlayerBuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -3, -2)
	end
end)
