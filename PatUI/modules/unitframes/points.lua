local P, C, L, G = unpack(Tukui)
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
	
	if(IsAddOnLoaded("PatUI_DPS")) then
		TukuiPlayer:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPLEFT", -160, 50)
		TukuiTarget:SetPoint("BOTTOMRIGHT", TukuiBar1, "TOPRIGHT", 160, 50)
		
		TukuiTargetTarget:SetPoint("BOTTOM", TukuiBar1, "TOP", 0, 50)
		TukuiPet:SetPoint("BOTTOM", TukuiTargetTarget, "TOP", 0, 15)
		TukuiFocus:SetPoint("BOTTOM", UIParent, "BOTTOM", -400, 400)
		
	elseif(IsAddOnLoaded("PatUI_Healing")) then		
		TukuiPlayer:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPLEFT", -254, 150)
		TukuiTarget:SetPoint("BOTTOMRIGHT", TukuiBar1, "TOPRIGHT", 254, 150)
		
		TukuiTargetTarget:SetPoint("TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -36)
		TukuiPet:SetPoint("TOPLEFT", TukuiPlayer, "BOTTOMLEFT", 0, -30)
		TukuiFocus:SetPoint("BOTTOM", UIParent, "BOTTOM", -600, 400)
		
	else
		TukuiPlayer:SetPoint("CENTER", UIParent, "CENTER", -228 , -201)
		TukuiTarget:SetPoint("CENTER", UIParent, "CENTER", 228 , -201)
	end
end)