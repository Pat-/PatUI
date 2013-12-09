local P, C, L, G = unpack(Tukui)

local bar = TukuiAltPowerBar
local status = TukuiAltPowerBarStatus
local text = TukuiAltPowerBarText

-- Borde for the bar
local statusbg = CreateFrame("Frame", "StatusBG", status)
statusbg:ClearAllPoints()
statusbg:Point("BOTTOM", UIParent, "BOTTOM", 0, 2)
statusbg:Size(TukuiBar1:GetWidth(), 18)
statusbg:SetTemplate("Default")
statusbg:ThickBorder()
statusbg:SetFrameLevel(status:GetFrameLevel() - 1)

-- position status bar
status:ClearAllPoints()
status:Point("TOPLEFT", StatusBG, "TOPLEFT", 2, -2)
status:Point("BOTTOMRIGHT", StatusBG, "BOTTOMRIGHT", -2, 2)

-- change the font
text:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
text:ClearAllPoints()
text:Point("CENTER", status, "CENTER", 0, 0)