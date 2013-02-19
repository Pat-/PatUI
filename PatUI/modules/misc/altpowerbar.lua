local P, C, L, G = unpack(Tukui)

local bar = TukuiAltPowerBar
local status = TukuiAltPowerBarStatus
local text = TukuiAltPowerBarText

-- position the bar
bar:SetBackdropBorderColor(0, 0, 0, 0)
bar:HideInsets()
bar:SetBackdropColor(0, 0, 0, 0)

-- position status bar
status:Size(TukuiBar1:GetWidth(), 18)
status:ClearAllPoints()
status:Point("BOTTOM", UIParent, "BOTTOM", 0, 2)

-- Borde for the bar
local statusbg = CreateFrame("Frame", "StatusBG", status)
statusbg:ClearAllPoints()
statusbg:Point("TOPLEFT", 0, 0)
statusbg:Point("BOTTOMRIGHT", 0, 0)
statusbg:Size(1, 1)
statusbg:SetTemplate("Default")
statusbg:SetBorder(false, true)
statusbg:SetBackdropBorderColor(0, 0, 0, 0)
statusbg:HideInsets()
statusbg:SetFrameLevel(status:GetFrameLevel() - 1)

-- change the font
text:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
text:ClearAllPoints()
text:Point("CENTER", status, "CENTER", 0, 0)