local P, C, L, G = unpack(Tukui)

------------------------------------------------------------------------
-- Create Datatext frames
------------------------------------------------------------------------

local DataPoint = {}

for i=1, 6 do
	DataPoint[i] = CreateFrame("Frame", "DataPoint"..i, UIParent)
	DataPoint[i]:SetTemplate("Transparent")
	DataPoint[i]:ThickBorder()
	DataPoint[i]:SetWidth(90)
	DataPoint[i]:SetHeight(20)
	
	if (i == 1) then
		DataPoint[i]:Point("TOPLEFT", UIParent, "TOPLEFT", 2, -2)
	else
		DataPoint[i]:Point("TOPLEFT", "DataPoint"..i - 1, "BOTTOMLEFT", 0, -3)
	end
end

local panels = { TukuiMinimapStatsLeft, TukuiMinimapStatsRight, TukuiInfoLeftLineVertical, TukuiInfoRightLineVertical, TukuiLineToABLeft, TukuiLineToABRight, TukuiCubeLeft, TukuiCubeRight, TukuiLineToABLeftAlt, TukuiLineToABRightAlt, TukuiLineToPetActionBarBackground, }

for _, panel in pairs(panels) do
	panel:Kill()
end

TukuiInfoRight:SetAlpha(0)
TukuiExitVehicleButtonRight:SetAlpha(0)

chatbg = CreateFrame("Frame", "ChatBackground", UIParent)
chatbg:SetTemplate("Transparent")
chatbg:ThickBorder()
chatbg:SetFrameStrata("BACKGROUND")
chatbg:SetWidth(P.InfoLeftRightWidth + 12) 
chatbg:SetHeight(177)
chatbg:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 3, 3)

chatbg2 = CreateFrame("Frame", "ChatBackground2", UIParent)
chatbg2:SetTemplate("Transparent")
chatbg2:ThickBorder()
chatbg2:SetFrameStrata("BACKGROUND")
chatbg2:SetWidth(P.InfoLeftRightWidth + 12) 
chatbg2:SetHeight(177)
chatbg2:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -3, 3)

if C.chat.lootchat == true then
	chatbg2:Show()
else
	chatbg2:Hide()
end

TukuiInfoLeft:ClearAllPoints()
TukuiInfoLeft:SetPoint("BOTTOM", ChatBackground, "TOP", 0, -2)
TukuiInfoLeft:SetWidth(P.InfoLeftRightWidth + 12)
TukuiInfoLeft:SetParent(UIParent)
TukuiInfoLeft:SetAlpha(0)

-- put this closer to minimap bottom
TukuiRaidUtilityShowButton:ClearAllPoints()
TukuiRaidUtilityShowButton:Point("TOP", TukuiMinimap, "BOTTOM", 0, -4)
