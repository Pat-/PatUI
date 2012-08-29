local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
-- Setup Frame Points
------------------------------------------------------------------------

TukuiPlayer:ClearAllPoints()
TukuiTarget:ClearAllPoints()
TukuiPet:ClearAllPoints()
TukuiTargetTarget:ClearAllPoints()
TukuiFocus:ClearAllPoints()

TukuiPlayer:Point("TOP", UIParent, "BOTTOM", -179 , 230)
TukuiPet:Point("TOPLEFT", TukuiPlayer, "BOTTOMLEFT", 0, -13)
TukuiTargetTarget:Point("TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -13)
TukuiTarget:Point("TOP", UIParent, "BOTTOM", 179, 230)
TukuiFocus:Point("LEFT", TukuiPlayer, "RIGHT", 7, 0)

