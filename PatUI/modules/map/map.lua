local P, C, L, G = unpack(Tukui)


TukuiMinimap:ClearAllPoints()
TukuiMinimap:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 0)
TukuiMinimap:SetBorder(false, false)
TukuiMinimap:HideInsets()
TukuiMinimap:SetBackdropBorderColor(0,0,0,0)
TukuiMinimap:SetBackdrop(nil)

-- Zone coordinates on hovering minimap.
TukuiMinimapCoord:SetTemplate("Transparent")
TukuiMinimapCoord:HideInsets()
TukuiMinimapCoord:SetBackdropBorderColor(0,0,0,0)
TukuiMinimapCoord:SetBackdrop(nil)
TukuiMinimapCoord:ClearAllPoints()
TukuiMinimapCoord:SetPoint("BOTTOMRIGHT", TukuiMinimap, "BOTTOMRIGHT", -2, 2)
TukuiMinimapCoordText:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")

-- Zone text when hovering minimap.
TukuiMinimapZone:SetTemplate("Transparent")
TukuiMinimapZone:HideInsets()
TukuiMinimapZone:SetBackdropBorderColor(0,0,0,0)
TukuiMinimapZone:SetBackdrop(nil)
TukuiMinimapZoneText:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE") -- So sexeh.

-- Skin the ticket panel.
TukuiTicket:SetTemplate("Transparent")
TukuiTicket:HideInsets()
TukuiTicket:SetBackdropBorderColor(0,0,0,0)
TukuiTicket:SetBorder(false, true)
TukuiTicket:Size(23)
TukuiTicket.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor1)).."T")
TukuiTicket.Text:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
TukuiTicket:ClearAllPoints()
TukuiTicket:SetPoint("BOTTOMLEFT", TukuiMinimap, "BOTTOMLEFT", 2, 2)

-- 1px border.
local mapBG = CreateFrame("Frame", mapBG, TukuiMinimap)
mapBG:ClearAllPoints()
mapBG:SetPoint("TOPLEFT", 2, -2)
mapBG:SetPoint("BOTTOMRIGHT", -2, 2)
mapBG:Size(1, 1)
mapBG:SetTemplate("Default")
mapBG:SetBorder(false, true)
mapBG:HideInsets()
mapBG:SetFrameStrata("Low")