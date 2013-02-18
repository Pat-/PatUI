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
TukuiBar1:SetBackdropBorderColor(0, 0, 0, 0)
TukuiBar1:HideInsets()
TukuiBar1:SetBorder(false, true)
if TukuiBar4:IsShown() then
	TukuiBar1:SetHeight((P.buttonsize * 2) + (P.buttonspacing * 3))
end

TukuiBar4:HookScript("OnHide", function()
	TukuiBar1:SetHeight((P.buttonsize * 1) + (P.buttonspacing * 2))
end)

TukuiBar4:HookScript("OnShow", function()
	TukuiBar1:SetHeight((P.buttonsize * 2) + (P.buttonspacing * 3))
end)

TukuiBar2:Width((P.buttonsize * 3) + (P.buttonspacing * 4))
TukuiBar2:Height(TukuiBar1:GetHeight())
TukuiBar2:SetTemplate("Transparent")
TukuiBar2:SetBackdropBorderColor(0, 0, 0, 0)
TukuiBar2:HideInsets()
TukuiBar2:SetBorder(false, true)

TukuiBar3:ClearAllPoints()
TukuiBar3:Point("BOTTOM", TukuiTabsLeftBackground, "TOP", 0, 8)
TukuiBar3:Width((P.buttonsize * 12) + (P.buttonspacing * 13))
TukuiBar3:Height((P.buttonsize * 1) + (P.buttonspacing * 2))
TukuiBar3:SetTemplate("Transparent")
TukuiBar3:SetBackdropBorderColor(0, 0, 0, 0)
TukuiBar3:HideInsets()
TukuiBar3:SetBorder(false, true)

TukuiBar4:ClearAllPoints()
TukuiBar4:Point("CENTER", TukuiBar1, "CENTER", 0, 0)
TukuiBar4:HideInsets()
TukuiBar4:SetTemplate("Transparent")
TukuiBar4:SetBackdropBorderColor(0, 0, 0, 0)
TukuiBar4:SetBackdrop(nil)

TukuiBar5:ClearAllPoints()
TukuiBar5:SetHeight((P.buttonsize * 12) + (P.buttonspacing * 12))
TukuiBar5:SetWidth((P.buttonsize * 1) + (P.buttonspacing * 2))
TukuiBar5:Point("RIGHT", UIParent, "RIGHT", -2, -14)
TukuiBar5:SetTemplate("Transparent")
TukuiBar5:SetBackdropBorderColor(0, 0, 0, 0)
TukuiBar5:HideInsets()
TukuiBar5:SetBorder(false, true)

------------------------------------------------------------------------
-- Setting up Actionbar Buttons
------------------------------------------------------------------------

TukuiBar4Button:Size(TukuiBar1:GetWidth(), 19)
TukuiBar4Button:ClearAllPoints()
TukuiBar4Button:SetPoint("BOTTOM", TukuiBar1, "TOP", 0, 3)
TukuiBar4Button:SetTemplate("Transparent")
TukuiBar4Button:SetBorder(false, true)
TukuiBar4Button:HideInsets()
TukuiBar4Button:SetBackdropBorderColor(0, 0, 0, 0)

TukuiBar5ButtonTop:SetTemplate("Transparent")
TukuiBar5ButtonTop:SetBorder(false, true)
TukuiBar5ButtonTop:HideInsets()
TukuiBar5ButtonTop:SetBackdropBorderColor(0, 0, 0, 0)

TukuiBar5ButtonBottom:SetTemplate("Transparent")
TukuiBar5ButtonBottom:SetBorder(false, true)
TukuiBar5ButtonBottom:HideInsets()
TukuiBar5ButtonBottom:SetBackdropBorderColor(0, 0, 0, 0)


------------------------------------------------------------------------
-- Setting up ChatFrames
------------------------------------------------------------------------

TukuiChatBackgroundLeft:SetFrameStrata("Background")
TukuiChatBackgroundLeft:SetBackdropBorderColor(0, 0, 0, 0)
TukuiChatBackgroundLeft:HideInsets()
TukuiChatBackgroundLeft:SetBorder(false, true)
TukuiChatBackgroundLeft:ClearAllPoints()
TukuiChatBackgroundLeft:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 2)
TukuiChatBackgroundLeft:SetHeight(125)

TukuiTabsLeftBackground:ClearAllPoints()
TukuiTabsLeftBackground:Point("BOTTOM", TukuiChatBackgroundLeft, "TOP", 0, 3)
TukuiTabsLeftBackground:SetWidth(TukuiChatBackgroundLeft:GetWidth())
TukuiTabsLeftBackground:SetBackdrop(nil)
TukuiTabsLeftBackground:SetTemplate("Transparent")
TukuiTabsLeftBackground:SetBackdropBorderColor(0, 0, 0, 0)
TukuiTabsLeftBackground:SetBorder(false, true)
TukuiTabsLeftBackground:HideInsets()

TukuiChatBackgroundRight:Hide()
TukuiTabsRightBackground:Hide()
TukuiInfoRight:Hide()

TukuiInfoLeft:ClearAllPoints()
TukuiInfoLeft:Point("BOTTOM", UIParent, "BOTTOM", 0, -50)
TukuiInfoLeft:SetFrameStrata("Background")
TukuiInfoLeft:SetTemplate("Transparent")
TukuiInfoLeft:SetHeight(14)
TukuiInfoLeft:SetBackdrop(nil)
TukuiInfoLeft:SetBackdropBorderColor(0, 0, 0, 0)
TukuiInfoLeft:HideInsets()

------------------------------------------------------------------------
-- Reanchor the Raid Util
------------------------------------------------------------------------

TukuiRaidUtilityShowButton:ClearAllPoints()
TukuiRaidUtilityShowButton:Point("TOP", TukuiMinimap, "BOTTOM", 0, -4)


