local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
-- Setup Frame Points
------------------------------------------------------------------------
local FramePositions = CreateFrame("Frame")
FramePositions:RegisterEvent("PLAYER_ENTERING_WORLD")
FramePositions:SetScript("OnEvent", function(self, event, addon)

	TukuiPlayer:ClearAllPoints()
	TukuiTarget:ClearAllPoints()
	TukuiPet:ClearAllPoints()
	TukuiTargetTarget:ClearAllPoints()
	TukuiFocus:ClearAllPoints()
	
	if(IsAddOnLoaded("PatUI_DPS")) then
		TukuiPlayer:SetPoint("TOP", UIParent, "BOTTOM", -179 , 230)
		TukuiTarget:SetPoint("TOP", UIParent, "BOTTOM", 179 , 230)
	elseif(IsAddOnLoaded("PatUI_Healing")) then
		TukuiPlayer:Point("TOP", UIParent, "BOTTOM", -309 , 315)
		TukuiTarget:Point("TOP", UIParent, "BOTTOM", 310, 315)
	else
		TukuiPlayer:SetPoint("TOP", UIParent, "BOTTOM", -179 , 230)
		TukuiTarget:SetPoint("TOP", UIParent, "BOTTOM", 179 , 230)
	end

	TukuiPet:Point("TOPLEFT", TukuiPlayer, "BOTTOMLEFT", 0, -13)
	TukuiTargetTarget:Point("TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -13)
	TukuiFocus:Point("RIGHT", TukuiPlayer, "LEFT", -7, 0)
end)