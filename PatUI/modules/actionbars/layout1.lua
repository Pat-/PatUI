local P, C, L, G = unpack(Tukui)
if not C.actionbar.enable == true then return end
if C.actionbar.style ~= 1 then return end

-----------------------------------------------------
-- This kind of layout is for people that need around
-- 2 or more actionbars for PvE, PvP, Etc, other 
-- players should use style 2 if they don't need this
------------------------------------------------------

-- Adjusting Actionbar 1 here, changes height if Bar4 is shown or not
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

TukuiBar5:ClearAllPoints()
TukuiBar5:Point("RIGHT", UIParent, "RIGHT", -4, 0)

-- Setting up Actionbar templates here
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

-- Adjusting buttons here
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

-- for people that want a 3x3 side bar style.
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