local P, C, L, G = unpack(Tukui)

local bar = TukuiBar2
local bar2 = SplitBarRight
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
		b:ClearAllPoints()
		b:SetPoint("BOTTOMLEFT", SplitBarRight, P.buttonspacing, P.buttonspacing)
	elseif i == 10 then
		b:ClearAllPoints()
		b:SetPoint("TOPLEFT", SplitBarRight, P.buttonspacing, -P.buttonspacing)
	else
		b:SetPoint("LEFT", b2, "RIGHT", P.buttonspacing, 0)
	end
end
