local P, C, L, G = unpack(Tukui)

------------------------------------------------------------------------
-- Setting up Panels
------------------------------------------------------------------------

local panels = { TukuiMinimapStatsLeft, TukuiMinimapStatsRight, TukuiInfoLeftLineVertical, TukuiInfoRightLineVertical, TukuiLineToABLeft, TukuiLineToABRight, TukuiCubeLeft, TukuiCubeRight, TukuiLineToABLeftAlt, TukuiLineToABRightAlt, TukuiLineToPetActionBarBackground, }

for _, panel in pairs(panels) do
	panel:Kill()
end

------------------------------------------------------------------------
-- Setting up Actionbars
------------------------------------------------------------------------

TukuiBar1:ClearAllPoints()
TukuiBar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 23)
TukuiBar1:SetWidth((P.buttonsize * 12) + (P.buttonspacing * 13))
TukuiBar1:SetTemplate("Transparent")

local Bar4 = CreateFrame("Frame", "Bar4", UIParent, "SecureHandlerStateTemplate")
Bar4:Point("CENTER", TukuiBar1, "CENTER", 0, 0)
Bar4:SetWidth((P.buttonsize * 12) + (P.buttonspacing * 13))
Bar4:SetHeight((P.buttonsize * 2) + (P.buttonspacing * 3))
Bar4:HideInsets()
Bar4:SetBackdropBorderColor(0, 0, 0, 0)
Bar4:SetBackdrop(nil)

if Bar4:IsShown() then
	TukuiBar1:SetHeight((P.buttonsize * 2) + (P.buttonspacing * 3))
end

Bar4:HookScript("OnHide", function()
	TukuiBar1:SetHeight((P.buttonsize * 1) + (P.buttonspacing * 2))
end)

Bar4:HookScript("OnShow", function()
	TukuiBar1:SetHeight((P.buttonsize * 2) + (P.buttonspacing * 3))
end)

TukuiBar2:Width((P.buttonsize * 3) + (P.buttonspacing * 4))
TukuiBar2:Height(TukuiBar1:GetHeight())
TukuiBar2:SetTemplate("Transparent")

SplitBarRight = CreateFrame("Frame", "SplitBarRight", UIParent, "SecureHandlerStateTemplate")
SplitBarRight:Point("BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", 6, 0)
SplitBarRight:Width((P.buttonsize * 3) + (P.buttonspacing * 4))
SplitBarRight:Height(TukuiBar1:GetHeight())
SplitBarRight:SetTemplate("Transparent")
SplitBarRight:SetFrameLevel(TukuiBar1:GetFrameLevel())
SplitBarRight:SetFrameStrata(TukuiBar1:GetFrameStrata())

TukuiBar5:ClearAllPoints()
TukuiBar5:SetHeight((P.buttonsize * 12) + (P.buttonspacing * 13))
TukuiBar5:SetWidth((P.buttonsize * 1) + (P.buttonspacing * 2))
TukuiBar5:Point("RIGHT", UIParent, "RIGHT", -2, -14)
TukuiBar5:SetTemplate("Transparent")

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
TukuiChatBackgroundLeft:SetHeight(125)

TukuiTabsLeftBackground:ClearAllPoints()
TukuiTabsLeftBackground:Point("BOTTOM", TukuiChatBackgroundLeft, "TOP", 0, 3)
TukuiTabsLeftBackground:SetWidth(TukuiChatBackgroundLeft:GetWidth())
TukuiTabsLeftBackground:PatSkin()

TukuiChatBackgroundRight:SetFrameStrata("Background")
TukuiChatBackgroundRight:ThickBorder()
TukuiChatBackgroundRight:ClearAllPoints()
TukuiChatBackgroundRight:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 4)
TukuiChatBackgroundRight:SetHeight(125)

TukuiTabsRightBackground:ClearAllPoints()
TukuiTabsRightBackground:Point("BOTTOM", TukuiChatBackgroundRight, "TOP", 0, 3)
TukuiTabsRightBackground:SetWidth(TukuiChatBackgroundRight:GetWidth())
TukuiTabsRightBackground:PatSkin()
TukuiTabsRightBackground:SetParent(TukuiChatBackgroundRight)

TukuiInfoRight:ClearAllPoints()
TukuiInfoRight:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -1000, 0)

TukuiInfoLeft:ClearAllPoints()
TukuiInfoLeft:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -1000, 0)

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
