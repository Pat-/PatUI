local P, C, L, G = unpack(Tukui)

TukuiStance:ClearAllPoints()
TukuiStance:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 6, -40)

local sborder = CreateFrame("Frame", "StanceBorder", StanceButton1)
sborder:Point("LEFT", -P.buttonspacing, 0)
sborder:SetTemplate("Transparent")
sborder:SetFrameLevel(1)
sborder:SetFrameStrata("BACKGROUND")
sborder:ThickBorder()

TukuiStance:HookScript("OnEvent", function(self, event, ...)
	StanceBorder:Size(((StanceButton1:GetWidth() + P.buttonspacing) * GetNumShapeshiftForms()) + P.buttonspacing, StanceButton1:GetHeight() + 2 * P.buttonspacing)
end)