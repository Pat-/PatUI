local P, C, L = unpack(Tukui)

local status = TukuiThreatBar

status:SetParent(UIParent)
status:Size(250, 21)
status:ClearAllPoints()
status:Point("TOP", UIParent, "TOP", 0, -160)

local background = CreateFrame("Frame", nil, status)
background:SetFrameLevel(status:GetFrameLevel() - 1)
background:Point("TOPLEFT", -2, 2)
background:Point("BOTTOMRIGHT", 2, -2)
background:SetTemplate("Transparent")
background:ThickBorder()

status.text:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
status.Title:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
