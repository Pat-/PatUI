local P, C, L = unpack(Tukui)

local bar = TukuiAltPowerBar
local status = TukuiAltPowerBarStatus
local text = TukuiAltPowerBarText

-- position the bar
bar:SetParent(UIParent)
bar:ClearAllPoints()
bar:Size(250, 21)
bar:SetPoint("TOP", 0, -130)
bar:SetTemplate()

-- position status bar
status:SetParent(bar)
status:ClearAllPoints()
status:Point("TOPLEFT", 2, -2)
status:Point("BOTTOMRIGHT", -2, 2)

-- change the font
text:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")