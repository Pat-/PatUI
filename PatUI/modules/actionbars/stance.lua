local P, C, L, G = unpack(Tukui)

TukuiStance:ClearAllPoints()
TukuiStance:SetPoint("TOPLEFT", DataPoint6, "BOTTOMLEFT", 4, -44)

local sborder = CreateFrame("Frame", "StanceBorder", StanceButton1)
sborder:Point("LEFT", -P.buttonspacing, 0)
sborder:SetTemplate("Transparent")
sborder:ThickBorder()
sborder:SetFrameLevel(1)
sborder:SetFrameStrata("BACKGROUND")

TukuiStance:HookScript( "OnEvent", function( self, event, ... )
	StanceBorder:Size((( StanceButton1:GetWidth() + P.buttonspacing) * GetNumShapeshiftForms()) + P.buttonspacing, StanceButton1:GetHeight() + 2 * P.buttonspacing)
end)
