local P, C, L, G = unpack(Tukui)

local bar = TukuiBar2
local bar2 = SplitBarRight
MultiBarBottomLeft:SetParent(bar)

SplitBarRight = CreateFrame("Frame", "SplitBarRight", UIParent)
SplitBarRight:Point("BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", 6, 0)
SplitBarRight:Width((P.buttonsize * 3) + (P.buttonspacing * 4))
SplitBarRight:Height(TukuiBar1:GetHeight())
SplitBarRight:SetTemplate("Transparent")
SplitBarRight:SetFrameLevel(TukuiBar1:GetFrameLevel())
SplitBarRight:SetFrameStrata(TukuiBar1:GetFrameStrata())

-- Flying figured out how to make buttons 8-12 work properly.
TukuiBar2:HookScript("OnHide", function()
	SplitBarRight:Hide()
end)

TukuiBar2:HookScript("OnShow", function()
	SplitBarRight:Show()
end)

if Bar4:IsShown() then
	SplitBarRight:Height((P.buttonsize * 2) + (P.buttonspacing * 3))
else
	SplitBarRight:Height((P.buttonsize * 1) + (P.buttonspacing * 2))
end

Bar4:HookScript("OnHide", function()
	SplitBarRight:Height((P.buttonsize * 1) + (P.buttonspacing * 2))
end)

Bar4:HookScript("OnShow", function()
	SplitBarRight:Height((P.buttonsize * 2) + (P.buttonspacing * 3))
end)

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
		b:ClearAllPoints()
		b:SetPoint("BOTTOMLEFT", SplitBarRight, P.buttonspacing, P.buttonspacing)
	elseif i == 10 then
		b:ClearAllPoints()
		b:SetPoint("TOPLEFT", SplitBarRight, P.buttonspacing, -P.buttonspacing)
	else
		b:SetPoint("LEFT", b2, "RIGHT", P.buttonspacing, 0)
	end
end
