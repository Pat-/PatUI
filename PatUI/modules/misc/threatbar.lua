local P, C, L, G = unpack(Tukui)

local status = TukuiThreatBar

status:SetParent(UIParent)
status:Size(250, 21)
status:ClearAllPoints()
status:Point("TOP", UIParent, "TOP", 0, -160)

status.bg:SetVertexColor(0, 0, 0, 0)

local background = CreateFrame("Frame", nil, status)
background:SetFrameLevel(status:GetFrameLevel() - 1)
background:Point("TOPLEFT", 0, 0)
background:Point("BOTTOMRIGHT", 0, 0)
background:SetTemplate("Transparent")
background:ThickBorder()

status.text:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
status.Title:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
