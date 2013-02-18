local P, C, L, G = unpack(Tukui)

TukuiMinimap:ClearAllPoints()
TukuiMinimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 0, 0)
TukuiMinimap:SetBorder(false, false)
TukuiMinimap:HideInsets()
TukuiMinimap:SetBackdropBorderColor(0, 0, 0, 0)
TukuiMinimap:SetBackdrop(nil)

-- Zone coordinates on hovering minimap.
TukuiMinimapCoord:SetTemplate("Transparent")
TukuiMinimapCoord:HideInsets()
TukuiMinimapCoord:SetBackdropBorderColor(0, 0, 0, 0)
TukuiMinimapCoord:SetBackdrop(nil)
TukuiMinimapCoord:ClearAllPoints()
TukuiMinimapCoord:SetPoint("BOTTOMRIGHT", TukuiMinimap, "BOTTOMRIGHT", -2, 2)
TukuiMinimapCoordText:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")

-- Zone text when hovering minimap.
TukuiMinimapZone:SetTemplate("Transparent")
TukuiMinimapZone:HideInsets()
TukuiMinimapZone:SetBackdropBorderColor(0, 0, 0, 0)
TukuiMinimapZone:SetBackdrop(nil)
TukuiMinimapZoneText:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE") -- So sexeh.

-- Skin the ticket panel.
TukuiTicket:SetTemplate("Transparent")
TukuiTicket:HideInsets()
TukuiTicket:SetBackdropBorderColor(0, 0, 0, 0)
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

TukuiAurasPlayerBuffs:ClearAllPoints()
TukuiAurasPlayerDebuffs:ClearAllPoints()

TukuiAurasPlayerBuffs:SetAttribute("wrapAfter", 17)
TukuiAurasPlayerBuffs:SetAttribute("xOffset", -29)
TukuiAurasPlayerBuffs:SetAttribute("wrapYOffset", 35)

TukuiAurasPlayerBuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT",  -146, 0)
TukuiAurasPlayerDebuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -146, -107)

local HookFrames = {
	TukuiAurasPlayerBuffs,
	TukuiAurasPlayerDebuffs,
	TukuiAurasPlayerConsolidate,
}

local OnAttributeChanged = function(self)
	for i = 1, self:GetNumChildren() do
		local child = select(i, self:GetChildren())

		if(child) then
			child:SetBackdrop(nil)
			child:SetBorder(true, false)
			child:SetBackdropBorderColor(0, 0, 0, 0)
			child:HideInsets()
		end

		if(child.Duration) then
			child.Duration:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
			child.Duration:ClearAllPoints()
			child.Duration:SetPoint("CENTER", 0, -8)

		if C.auras.classictimer == false then
				child.Duration:Kill()
			end
		end

		if(child.Icon) then
			child.Icon:ClearAllPoints()
			child.Icon:Point("TOPLEFT", child, 2, -2)
			child.Icon:Point("BOTTOMRIGHT", child, -2, 2)
		end


		if(child.Holder) then
			child.Holder:SetBorder(false, true)
			child.Holder:SetBackdropBorderColor(0, 0, 0, 0)
			child.Holder:HideInsets()
			child.Holder:SetHeight(2)
			child.Holder:ClearAllPoints()
			child.Holder:Point("TOP", child, "BOTTOM", 0, -1)
			child.Holder:SetWidth(child:GetWidth() - 4)

			child.Bar:ClearAllPoints()
			child.Bar:Point("TOPLEFT", child.Holder, 0, 0)
			child.Bar:Point("BOTTOMRIGHT", child.Holder, 0, 0)
		end

		if(child.Count) then
			child.Count:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
			child.Count:ClearAllPoints()
			child.Count:SetPoint("TOP", 0, -4)
		end
	end
end

for _, frame in pairs(HookFrames) do
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:HookScript("OnAttributeChanged", OnAttributeChanged)
	frame:HookScript("OnEvent", OnAttributeChanged)
end