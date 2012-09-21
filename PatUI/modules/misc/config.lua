local P, C, L, G = unpack(Tukui)

-------------------------------------------
-- create our control panel here
-- Credits to Kacaos for this basic layout
-------------------------------------------
local cpbg = CreateFrame("Frame", "ControlPanelBackground", UIParent)
cpbg:Size(150, 88)
cpbg:Point("CENTER", UIParent, "CENTER", -267, -122)
cpbg:SetTemplate("Transparent")
cpbg:SetFrameStrata("Background")
cpbg:Hide()

local cpbgt = CreateFrame("Frame", "ControlPanelBackgroundTitle", ControlPanelBackground)
cpbgt:Size(150, 15)
cpbgt:Point("BOTTOM", ControlPanelBackground, "TOP", 0, 1)
cpbgt:SetTemplate("Transparent")
cpbgt:SetFrameStrata("Background")
cpbgt:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
cpbgt.Text:Point("CENTER", ControlPanelBackgroundTitle)
cpbgt.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Control Panel")
cpbgt.Text:SetShadowOffset(0, 0)

-- Create UICrontolButton
local cpb = CreateFrame("Frame", "ControlPanelButton", UIParent)
cpb:ClearAllPoints()
cpb:Size(90, 20)
cpb:SetTemplate("Transparent")

cpb:SetAlpha(0)
cpb:HookScript("OnEnter", function(self) self:SetAlpha(1) end)
cpb:HookScript("OnLeave", function(self) self:SetAlpha(0) end)

cpb:Point("LEFT", DataPoint1, "RIGHT", 4, 0)
cpb:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
cpb.Text:Point("CENTER", ControlPanelButton, "CENTER", 3, 0)
cpb.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Control Panel")

ControlPanelButton:SetScript("OnMouseDown", function(self)
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	if ControlPanelBackground:IsShown() then
		ControlPanelBackground:Hide()
	else
		ControlPanelBackground:Show()
	end
end)
