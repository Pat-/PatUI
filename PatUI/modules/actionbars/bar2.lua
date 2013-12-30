local P, C, L, G = unpack(Tukui)

TukuiBar2:SetAlpha(0)

local LeftBar2 = CreateFrame("Frame", "LeftBar2", UIParent, "SecureHandlerStateTemplate")
LeftBar2:Point("BOTTOMRIGHT", TukuiBar1, "BOTTOMLEFT", -6, 0)
LeftBar2:Width((P.buttonsize * 3) + (P.buttonspacing * 4))
LeftBar2:Height((P.buttonsize * 2) + (P.buttonspacing * 3))
LeftBar2:SetTemplate("Transparent")
LeftBar2:SetFrameLevel(TukuiBar1:GetFrameLevel())
LeftBar2:SetFrameStrata(TukuiBar1:GetFrameStrata())

local RightBar2 = CreateFrame("Frame", "RightBar2", UIParent, "SecureHandlerStateTemplate")
RightBar2:Point("BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", 6, 0)
RightBar2:Width((P.buttonsize * 3) + (P.buttonspacing * 4))
RightBar2:Height((P.buttonsize * 2) + (P.buttonspacing * 3))
RightBar2:SetTemplate("Transparent")
RightBar2:SetFrameLevel(TukuiBar1:GetFrameLevel())
RightBar2:SetFrameStrata(TukuiBar1:GetFrameStrata())

local bar = LeftBar2
local bar2 = RightBar2
MultiBarBottomLeft:SetParent(bar)

-- setup the bar
for i=1, 12 do
	local b = _G["MultiBarBottomLeftButton"..i]
	local b2 = _G["MultiBarBottomLeftButton"..i-1]
	b:SetSize(P.buttonsize, P.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("BOTTOMLEFT", bar, P.buttonspacing, P.buttonspacing)
	elseif i == 7 then
		b:SetPoint("TOPLEFT", bar, P.buttonspacing, -P.buttonspacing)
	elseif i == 4 then
		b:SetPoint("BOTTOMLEFT", bar2, P.buttonspacing, P.buttonspacing)
	elseif i == 10 then
		b:SetPoint("TOPLEFT", bar2, P.buttonspacing, -P.buttonspacing)
	else
		b:SetPoint("LEFT", b2, "RIGHT", P.buttonspacing, 0)
	end
end
