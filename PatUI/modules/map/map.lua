local P, C, L, G = unpack(Tukui)

TukuiMinimap:ClearAllPoints()
TukuiMinimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -3, -3)

TukuiAurasPlayerBuffs:ClearAllPoints()
TukuiAurasPlayerBuffs:SetPoint("TOPRIGHT", TukuiMinimap, "TOPLEFT", -18, 0)