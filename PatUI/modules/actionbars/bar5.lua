local P, C, L, G = unpack(Tukui)

TukuiBar5:SetAlpha(0)

local buttonsize = 25

local LeftBar = CreateFrame("Frame", "LeftBar", UIParent, "SecureHandlerStateTemplate")
LeftBar:Point("LEFT", TukuiChatBackgroundLeft, "RIGHT", 3, 13)
LeftBar:Width((buttonsize * 1) + (P.buttonspacing * 2))
LeftBar:Height((buttonsize * 6) + (P.buttonspacing * 7))
LeftBar:SetFrameStrata("BACKGROUND")
LeftBar:SetFrameLevel(3)
LeftBar:SetTemplate("Transparent")

local RightBar = CreateFrame("Frame", "RightBar", UIParent, "SecureHandlerStateTemplate")
RightBar:Point("RIGHT", TukuiChatBackgroundRight, "LEFT", -3, 13)
RightBar:Width((buttonsize * 1) + (P.buttonspacing * 2))
RightBar:Height((buttonsize * 6) + (P.buttonspacing * 7))
RightBar:SetFrameStrata("BACKGROUND")
RightBar:SetFrameLevel(3)
RightBar:SetTemplate("Transparent")

local bar = LeftBar
local bar2 = RightBar
MultiBarRight:SetParent(bar)

for i= 1, 12 do
	local b = _G["MultiBarRightButton"..i]
	local b2 = _G["MultiBarRightButton"..i-1]
	b:SetSize(buttonsize, buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("TOPRIGHT", bar, -P.buttonspacing, -P.buttonspacing)
	elseif i == 7 then
		b:SetPoint("TOPRIGHT", bar2, -P.buttonspacing, -P.buttonspacing)
	else
		b:SetPoint("TOP", b2, "BOTTOM", 0, -P.buttonspacing)
	end
end
