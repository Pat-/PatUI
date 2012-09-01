local P, C, L, G = unpack(Tukui)

TukuiBar4Button:ClearAllPoints()
TukuiBar4Button:SetPoint("BOTTOM", TukuiBar1, "TOP", 0, 4)
TukuiBar4Button:SetHeight(15)

local buttons = {
	TukuiBar3Button,
	TukuiBar2Button,
	TukuiBar4Button,
}

for _,f in pairs(buttons) do
	f:SetTemplate("Transparent")
	f:ThickBorder()
end

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

local sborder = CreateFrame("Frame", "StanceBorder", StanceButton1)
sborder:Point("LEFT", -P.buttonspacing, 0)
sborder:SetTemplate("Transparent")
sborder:ThickBorder()
sborder:SetFrameLevel(1)
sborder:SetFrameStrata("BACKGROUND")

TukuiStance:HookScript( "OnEvent", function( self, event, ... )
	StanceBorder:Size((( StanceButton1:GetWidth() + P.buttonspacing) * GetNumShapeshiftForms()) + P.buttonspacing, StanceButton1:GetHeight() + 2 * P.buttonspacing)
end)

TukuiBar1:SetTemplate("Transparent")
TukuiBar1:ThickBorder()
if TukuiBar4:IsShown() then
	TukuiBar1:SetHeight((P.buttonsize * 2) + (P.buttonspacing * 3))
end

TukuiBar4:HookScript("OnHide", function()
	TukuiBar1:SetHeight((P.buttonsize * 1) + (P.buttonspacing * 2))
end)

TukuiBar4:HookScript("OnShow", function()
	TukuiBar1:SetHeight((P.buttonsize * 2) + (P.buttonspacing * 3))
end)

TukuiBar2:SetTemplate("Transparent")
TukuiBar2:ThickBorder()
TukuiBar3:SetTemplate("Transparent")
TukuiBar3:ThickBorder()
TukuiBar5:SetTemplate("Transparent")
TukuiBar5:ThickBorder()
TukuiPetBar:SetTemplate("Transparent")
TukuiPetBar:ThickBorder()

TukuiBar4:SetBackdrop(nil)
TukuiBar4:HideInsets()

if C.actionbar.smallsides == true then
	TukuiBar2:SetWidth((P.buttonsize * 3) + (P.buttonspacing * 4))
	TukuiBar3:SetWidth((P.buttonsize * 3) + (P.buttonspacing * 4))

	for i=7, 12 do
		local button = _G["MultiBarBottomLeftButton"..i]
		
		button:SetSize(0, 0)
		button:SetAlpha(0)
	end

	for i=1, 6 do
		local button = _G["MultiBarBottomLeftButton"..i]
		
		if i == 4 then
			button:ClearAllPoints()
			button:SetPoint("TOPLEFT", TukuiBar2, P.buttonspacing, -P.buttonspacing)
		end
	end

	for i=7, 12 do
		local button = _G["MultiBarBottomRightButton"..i]
		
		button:SetSize(0, 0)
		button:SetAlpha(0)
	end

	for i=1, 6 do
		local button = _G["MultiBarBottomRightButton"..i]
		
		if i == 4 then
			button:ClearAllPoints()
			button:SetPoint("TOPLEFT", TukuiBar3, P.buttonspacing, -P.buttonspacing)
		end
	end
end