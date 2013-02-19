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
TukuiBar2:SetBackdropBorderColor(0, 0, 0, 0)
TukuiBar2:HideInsets()
TukuiBar2:SetBorder(false, true)

TukuiBar5:ClearAllPoints()
TukuiBar5:SetHeight((P.buttonsize * 12) + (P.buttonspacing * 12))
TukuiBar5:SetWidth((P.buttonsize * 1) + (P.buttonspacing * 2))
TukuiBar5:Point("RIGHT", UIParent, "RIGHT", -2, -14)
TukuiBar5:SetTemplate("Transparent")
TukuiBar5:SetBackdropBorderColor(0, 0, 0, 0)
TukuiBar5:HideInsets()
TukuiBar5:SetBorder(false, true)

TukuiPetBar:SetTemplate("Transparent")
TukuiPetBar:SetBackdropBorderColor(0, 0, 0, 0)
TukuiPetBar:HideInsets()
TukuiPetBar:SetBorder(false, true)

TukuiLineToPetActionBarBackground:SetBackdrop(nil)

------------------------------------------------------------------------
-- Setting up Actionbar Buttons
------------------------------------------------------------------------

TukuiBar4Button:ClearAllPoints()

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

------------------------------------------------------------------------
-- Creating Datatext Points
------------------------------------------------------------------------

local Datatext1 = CreateFrame("Frame", "Datatext1", UIParent)
Datatext1:Point("TOPLEFT", TukuiBar1, "BOTTOMLEFT", 0, -3)
Datatext1:Width((TukuiBar1:GetWidth() / 3) - 2)
Datatext1:Height(18)
Datatext1:SetTemplate("Transparent")
Datatext1:SetBackdropBorderColor(0,0,0,0)
Datatext1:SetBorder(false, true)
Datatext1:HideInsets()
Datatext1:SetFrameStrata("BACKGROUND")

local Datatext2 = CreateFrame("Frame", "Datatext2", UIParent)
Datatext2:Point("TOP", TukuiBar1, "BOTTOM", 0, -3)
Datatext2:Width((TukuiBar1:GetWidth() / 3) - 1)
Datatext2:Height(18)
Datatext2:SetTemplate("Transparent")
Datatext2:SetBackdropBorderColor(0,0,0,0)
Datatext2:SetBorder(false, true)
Datatext2:HideInsets()
Datatext2:SetFrameStrata("BACKGROUND")

local Datatext3 = CreateFrame("Frame", "Datatext3", UIParent)
Datatext3:Point("TOPRIGHT", TukuiBar1, "BOTTOMRIGHT", 0, -3)
Datatext3:Width((TukuiBar1:GetWidth() / 3) - 2)
Datatext3:Height(18)
Datatext3:SetTemplate("Transparent")
Datatext3:SetBackdropBorderColor(0,0,0,0)
Datatext3:SetBorder(false, true)
Datatext3:HideInsets()
Datatext3:SetFrameStrata("BACKGROUND")

Datatext4 = CreateFrame("Frame", "Datatext4", TukuiMinimap)
Datatext4:Point("BOTTOM", TukuiMinimap, "BOTTOM", 0, 2)
Datatext4:Size((TukuiMinimap:GetWidth() - 7) / 2, 20)
Datatext4:SetFrameLevel((TukuiMinimap:GetFrameLevel()) + 2)
Datatext4:SetBackdrop(nil)
Datatext4:SetFrameStrata("HIGH")

Datatext5 = CreateFrame("Frame", "Datatext5", TukuiMinimap)
Datatext5:Point("TOP", TukuiMinimap, "TOP", 0, -2)
Datatext5:Size((TukuiMinimap:GetWidth() - 7) / 2, 20)
Datatext5:SetFrameLevel((TukuiMinimap:GetFrameLevel()) + 2)
Datatext5:SetBackdrop(nil)
Datatext5:SetFrameStrata("HIGH")
