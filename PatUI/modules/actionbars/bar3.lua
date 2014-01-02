local P, C, L, G = unpack(Tukui)

TukuiBar3:SetAlpha(0)

local buttonsize = 27.5

local Bar3 = CreateFrame("Frame", "Bar3", UIParent, "SecureHandlerStateTemplate")
Bar3:Point("BOTTOM", TukuiTabsLeftBackground, "TOP", 0, 12)
Bar3:Width((buttonsize * 12) + (P.buttonspacing * 13))
Bar3:Height((buttonsize * 1) + (P.buttonspacing * 2))
Bar3:SetFrameStrata("BACKGROUND")
Bar3:SetFrameLevel(3)
Bar3:SetTemplate("Transparent")

local bar = Bar3
MultiBarBottomRight:SetParent(bar)

for i= 1, 12 do
	local b = _G["MultiBarBottomRightButton"..i]
	local b2 = _G["MultiBarBottomRightButton"..i-1]
	b:SetSize(buttonsize, buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("BOTTOMLEFT", bar, P.buttonspacing, P.buttonspacing)
	else
		b:SetPoint("LEFT", b2, "RIGHT", P.buttonspacing, 0)
	end
	
	Bar3["Button"..i] = b
end
