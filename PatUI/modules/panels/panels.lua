local P, C, L, G = unpack(Tukui)

------------------------------------------------------------------------
-- Setting up Panels
------------------------------------------------------------------------

local panels = { TukuiMinimapStatsLeft, TukuiMinimapStatsRight, TukuiInfoLeftLineVertical, TukuiInfoRightLineVertical, TukuiLineToABLeft, TukuiLineToABRight, TukuiCubeLeft, TukuiCubeRight, TukuiLineToABLeftAlt, TukuiLineToABRightAlt, TukuiLineToPetActionBarBackground }

for _, panel in pairs(panels) do
	panel:Kill()
end

------------------------------------------------------------------------
-- Setting up Actionbars
------------------------------------------------------------------------

TukuiPetBar:SetTemplate("Transparent")
TukuiLineToPetActionBarBackground:SetBackdrop(nil)

------------------------------------------------------------------------
-- Setting up Actionbar Buttons
------------------------------------------------------------------------

TukuiBar4Button:ClearAllPoints()
TukuiBar5ButtonTop:PatSkin()
TukuiBar5ButtonBottom:PatSkin()

------------------------------------------------------------------------
-- Setting up ChatFrames
------------------------------------------------------------------------

TukuiChatBackgroundLeft:SetFrameStrata("Background")
TukuiChatBackgroundLeft:ThickBorder()
TukuiChatBackgroundLeft:ClearAllPoints()
TukuiChatBackgroundLeft:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 4, 4)
TukuiChatBackgroundLeft:SetHeight(151.5)

TukuiTabsLeftBackground:ClearAllPoints()
TukuiTabsLeftBackground:Point("BOTTOM", TukuiChatBackgroundLeft, "TOP", 0, 3)
TukuiTabsLeftBackground:SetWidth(TukuiChatBackgroundLeft:GetWidth())
TukuiTabsLeftBackground:PatSkin()

TukuiChatBackgroundRight:SetFrameStrata("Background")
TukuiChatBackgroundRight:ThickBorder()
TukuiChatBackgroundRight:ClearAllPoints()
TukuiChatBackgroundRight:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 4)
TukuiChatBackgroundRight:SetHeight(151.5)

TukuiTabsRightBackground:ClearAllPoints()
TukuiTabsRightBackground:Point("BOTTOM", TukuiChatBackgroundRight, "TOP", 0, 3)
TukuiTabsRightBackground:SetWidth(TukuiChatBackgroundRight:GetWidth())
TukuiTabsRightBackground:PatSkin()

TukuiInfoRight:ClearAllPoints()
TukuiInfoRight:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -1000)

TukuiInfoLeft:ClearAllPoints()
TukuiInfoLeft:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -1000)

------------------------------------------------------------------------
-- Reanchor the Raid Util
------------------------------------------------------------------------

TukuiRaidUtilityShowButton:ClearAllPoints()
TukuiRaidUtilityShowButton:Point("TOP", TukuiMinimap, "BOTTOM", 0, -4)

------------------------------------------------------------------------
-- Creating DataPoints
------------------------------------------------------------------------

local DataPoint = {}

for i=1, 6 do
	DataPoint[i] = CreateFrame("Frame", "DataPoint"..i, UIParent)
	DataPoint[i]:Width((TukuiBar1:GetWidth() / 3) - 3)
	DataPoint[i]:Height(18)
	DataPoint[i]:PatSkin()
	DataPoint[i]:SetFrameStrata("BACKGROUND")
	
	if(i == 1) then
		DataPoint[i]:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 4, -4)
	else
		DataPoint[i]:Point("TOP", "DataPoint"..i - 1, "BOTTOM", 0, -3)
	end
end
