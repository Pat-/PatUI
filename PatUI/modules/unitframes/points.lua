--[[local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
-- Setup Frame Points
------------------------------------------------------------------------
local FramePositions = CreateFrame("Frame")
FramePositions:RegisterEvent("ADDON_LOADED")
FramePositions:SetScript("OnEvent", function(self, event, addon)
	TukuiPlayer:ClearAllPoints()
	TukuiTarget:ClearAllPoints()
	TukuiPet:ClearAllPoints()
	TukuiTargetTarget:ClearAllPoints()
	TukuiFocus:ClearAllPoints()
	
	TukuiPlayer:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPLEFT", -160, 50)
	TukuiTarget:SetPoint("BOTTOMRIGHT", TukuiBar1, "TOPRIGHT", 160, 50)
	
	TukuiTargetTarget:SetPoint("BOTTOM", TukuiBar1, "TOP", 0, 50)
	TukuiPet:SetPoint("BOTTOM", TukuiTargetTarget, "TOP", 0, 15)
	TukuiFocus:SetPoint("BOTTOM", UIParent, "BOTTOM", -400, 400)
end)
]]--