if (IsAddOnLoaded("Tukui_UIPackages_Skins")) then return end
if not (IsAddOnLoaded("MinimalArchaeology")) then return end
local P, C, L, G = unpack(Tukui)

local frames = {
	MinArchDigsites,
	MinArchMain,
	MinArchHist,
	MinArchOptionPanelHideArtifact,
	MinArchOptionPanelFragmentCap,
	MinArchOptionPanelUseKeystones,
	MinArchOptionPanelMiscOptions,
	MinArchOptionPanelFrameScale,
}

for _,f in pairs(frames) do
	f:StripTextures()
	f:SetTemplate("Transparent")
	f:ThickBorder()
end

P.SkinCloseButton(MinArchMainButtonClose)
MinArchMainButtonClose:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", 2, 2)

P.SkinCloseButton(MinArchDigsitesButtonClose)
P.SkinCloseButton(MinArchHistButtonClose)

MinArchHist:HookScript("OnShow", function(self) 
	if not self.skinned then 
		MinArchScrollBar:SkinSlideBar(8) self.skinned = true 
		MinArchScrollBar:SetWidth(8)
	end 
end)

MinArchMainSkillBar:StripTextures()
MinArchMainSkillBar:CreateBackdrop()
MinArchMainSkillBar:SetStatusBarTexture(C["media"].normTex)

for i =1, 10 do
	_G["MinArchMainArtifactBar"..i]:StripTextures()
	_G["MinArchMainArtifactBar"..i]:CreateBackdrop()
	_G["MinArchMainArtifactBar"..i]:SetStatusBarTexture(C["media"].normTex)
	_G["MinArchMainArtifactBar"..i]:SetStatusBarColor(1.0, 0.4, 0)
	P.SkinButton(_G["MinArchMainArtifactBar"..i.."ButtonSolve"])
	
	_G["MinArchMainArtifactBar"..i.."ButtonSolve"]:FontString("text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	_G["MinArchMainArtifactBar"..i.."ButtonSolve"].text:SetPoint("CENTER", 1, 1)
	_G["MinArchMainArtifactBar"..i.."ButtonSolve"].text:SetText("Solve")
end

for i=1, 10 do
	_G["MinArchOptionPanelHideArtifact"..i]:SkinCheckBox()
	_G["MinArchOptionPanelFragmentCap"..i]:SkinCheckBox()
end

local checkbox = {
	MinArchOptionPanelMiscOptionsHideMinimap,
	MinArchOptionPanelMiscOptionsDisableSound,
	MinArchOptionPanelMiscOptionsStartHidden,
	MinArchOptionPanelMiscOptionsHideAfter,
	MinArchOptionPanelMiscOptionsWaitForSolve,
}

for _,c in pairs(checkbox) do
	c:SkinCheckBox()
end

MinArchOptionPanelFrameScaleSlider:SkinSlideBar(8)
MinArchOptionPanelFrameScaleSliderLow:ClearAllPoints()
MinArchOptionPanelFrameScaleSliderLow:SetPoint("BOTTOMLEFT", MinArchOptionPanelFrameScale, "BOTTOMLEFT", 3, 3)
MinArchOptionPanelFrameScaleSliderHigh:ClearAllPoints()
MinArchOptionPanelFrameScaleSliderHigh:SetPoint("BOTTOMRIGHT", MinArchOptionPanelFrameScale, "BOTTOMRIGHT", -3, 3)

-----------------------------------------------------------
-- Keystones option is funky
-----------------------------------------------------------

for i=1,2 do
	_G["MinArchOptionPanelUseKeystones"..i]:SkinCheckBox()
end

for i=4, 9 do
	_G["MinArchOptionPanelUseKeystones"..i]:SkinCheckBox()
end

--------------------------------------------------
-- Skin buttons on main window
--------------------------------------------------

MinArchMainButtonOpenADI:SetTemplate("Default")
MinArchMainButtonOpenADI:SetNormalTexture("")
MinArchMainButtonOpenADI:SetPushedTexture("")
MinArchMainButtonOpenADI:SetHighlightTexture("")
MinArchMainButtonOpenADI:SetSize(14, 14)
MinArchMainButtonOpenADI:FontString("text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
MinArchMainButtonOpenADI.text:SetPoint("CENTER", 2, 1)
MinArchMainButtonOpenADI.text:SetText("D")
MinArchMainButtonOpenADI:ClearAllPoints()

MinArchMainButtonOpenHist:SetTemplate("Default")
MinArchMainButtonOpenHist:SetNormalTexture("")
MinArchMainButtonOpenHist:SetPushedTexture("")
MinArchMainButtonOpenHist:SetHighlightTexture("")
MinArchMainButtonOpenHist:SetSize(14, 14)
MinArchMainButtonOpenHist:FontString("text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
MinArchMainButtonOpenHist.text:SetPoint("CENTER", 2, 1)
MinArchMainButtonOpenHist.text:SetText("H")
MinArchMainButtonOpenHist:ClearAllPoints()

MinArchMainButtonOpenArch:SetTemplate("Default")
MinArchMainButtonOpenArch:SetNormalTexture("")
MinArchMainButtonOpenArch:SetPushedTexture("")
MinArchMainButtonOpenArch:SetHighlightTexture("")
MinArchMainButtonOpenArch:SetSize(14, 14)
MinArchMainButtonOpenArch:FontString("text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
MinArchMainButtonOpenArch.text:SetPoint("CENTER", 2, 1)
MinArchMainButtonOpenArch.text:SetText("A")
MinArchMainButtonOpenArch:ClearAllPoints()

MinArchMainButtonOpenADI:Point("RIGHT", MinArchMainButtonOpenHist, "LEFT", -3, 0)
MinArchMainButtonOpenHist:Point("RIGHT", MinArchMainButtonOpenArch, "LEFT", -3, 0)
MinArchMainButtonOpenArch:Point("BOTTOMRIGHT", MinArchMain, "BOTTOMRIGHT", -6, 3)
