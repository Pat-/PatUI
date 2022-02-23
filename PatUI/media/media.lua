local T, C, L = Tukui:unpack()

if not C["Medias"] then C["Medias"] = {} end

local TukuiMedia = T["Media"]

local PatUI = CreateFont("PatUI")
PatUI:SetFont("Interface\\AddOns\\PatUI\\media\\fonts\\pixelfont.ttf", 10, "MONOCHROMEOUTLINE")
TukuiMedia:RegisterFont("PatUI", "PatUI")

TukuiMedia:RegisterTexture("PatUI", "Interface\\AddOns\\PatUI\\media\\textures\\PatUI.tga")
