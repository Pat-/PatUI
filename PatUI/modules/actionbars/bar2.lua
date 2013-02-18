local P, C, L, G = unpack(Tukui)

local bar = TukuiBar2
local bar2 = TukuiBar2Right
MultiBarBottomLeft:SetParent(bar)

TukuiBar2Right = CreateFrame("Frame", "TukuiBar2Right", UIParent)
TukuiBar2Right:Point("BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", 6, 0)
TukuiBar2Right:Width((P.buttonsize * 3) + (P.buttonspacing * 4))
TukuiBar2Right:Height(TukuiBar1:GetHeight())
TukuiBar2Right:SetTemplate("Transparent")
TukuiBar2Right:SetBackdropBorderColor(0,0,0,0)
TukuiBar2Right:HideInsets()
TukuiBar2Right:SetBorder(false, true)
TukuiBar2Right:SetFrameLevel(TukuiBar1:GetFrameLevel())
TukuiBar2Right:SetFrameStrata(TukuiBar1:GetFrameStrata())

TukuiBar2:HookScript("OnHide", function()
	TukuiBar2Right:Hide()
end)

TukuiBar2:HookScript("OnShow", function()
	TukuiBar2Right:Show()
end)

if Bar4:IsShown() then
	TukuiBar2Right:Height((P.buttonsize * 2) + (P.buttonspacing * 3))
else
	TukuiBar2Right:Height((P.buttonsize * 1) + (P.buttonspacing * 2))
end

Bar4:HookScript("OnHide", function()
	TukuiBar2Right:Height((P.buttonsize * 1) + (P.buttonspacing * 2))
end)

Bar4:HookScript("OnShow", function()
	TukuiBar2Right:Height((P.buttonsize * 2) + (P.buttonspacing * 3))
end)

-- setup the bar
for i=1, 12 do
	local b = _G["MultiBarBottomLeftButton"..i]
	local b2 = _G["MultiBarBottomLeftButton"..i-1]
	b:SetSize(P.buttonsize, P.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then -- Left.
		b:SetPoint("BOTTOMLEFT", bar, P.buttonspacing, P.buttonspacing)
	elseif i == 7 then -- Left
		b:SetPoint("TOPLEFT", bar, P.buttonspacing, -P.buttonspacing)
	elseif i == 4 then -- Right.
		b:ClearAllPoints()
		b:SetPoint("BOTTOMLEFT", TukuiBar2Right, P.buttonspacing, P.buttonspacing)
	elseif i == 10 then -- Right.
		b:ClearAllPoints()
		b:SetPoint("TOPLEFT", TukuiBar2Right, P.buttonspacing, -P.buttonspacing)
	else
		b:SetPoint("LEFT", b2, "RIGHT", P.buttonspacing, 0)
	end
	
	G.ActionBars.Bar2["Button"..i] = b
end

for i=7, 12 do
	local b = _G["MultiBarBottomLeftButton"..i]
	local b2 = _G["MultiBarBottomLeftButton1"]
	b:SetFrameLevel(b2:GetFrameLevel() - 2)

end

RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")