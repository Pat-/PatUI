local P, C, L, G = unpack(Tukui)

local sborder = CreateFrame("Frame", "StanceBorder", StanceButton1)
sborder:Point("LEFT", -P.buttonspacing, 0)
sborder:SetTemplate("Transparent")
sborder:SetFrameLevel(1)
sborder:SetFrameStrata("BACKGROUND")
sborder:SetBackdropBorderColor(0,0,0,0)
sborder:HideInsets()
sborder:SetBorder(false, true)

TukuiStance:HookScript("OnEvent", function(self, event, ...)
	StanceBorder:Size(((StanceButton1:GetWidth() + P.buttonspacing) * GetNumShapeshiftForms()) + P.buttonspacing, StanceButton1:GetHeight() + 2 * P.buttonspacing)
end)
