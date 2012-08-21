local P, C, L = unpack(Tukui)

local function style(self)
	local name = self:GetName()
	
	--> fixing a taint issue while changing totem flyout button in combat.
	if name:match("MultiCast") then return end
	
	--> don't skin the boss encounter extra button to match texture (4.3 patch)
	--> http://www.tukui.org/storage/viewer.php?id=913811extrabar.jpg
	if name:match("ExtraActionButton") then return end
	
	local Count = _G[name.."Count"]
	local HotKey = _G[name.."HotKey"]
	
	Count:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
	HotKey:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
	
end
hooksecurefunc("ActionButton_Update", style)

TukuiStance:ClearAllPoints()
TukuiStance:SetPoint("TOPLEFT", DataPoint6, "BOTTOMLEFT", 4, -44)

local ssborder = CreateFrame("Frame", "StanceBorder", StanceButton1)
ssborder:Point("LEFT", -P.buttonspacing, 0)
ssborder:SetTemplate("Transparent")
ssborder:ThickBorder()
ssborder:SetFrameLevel(1)
ssborder:SetFrameStrata("BACKGROUND")

TukuiStance:HookScript( "OnEvent", function( self, event, ... )
	StanceBorder:Size((( StanceButton1:GetWidth() + P.buttonspacing) * GetNumShapeshiftForms()) + P.buttonspacing, StanceButton1:GetHeight() + 2 * P.buttonspacing)
end)