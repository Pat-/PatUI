local P, C, L, G = unpack(Tukui)

TukuiBar1:ClearAllPoints()
TukuiBar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 23)
TukuiBar1:SetWidth((P.buttonsize * 12) + (P.buttonspacing * 13))
TukuiBar1:SetTemplate("Transparent")

local Bar4 = CreateFrame("Frame", "Bar4", UIParent, "SecureHandlerStateTemplate")
Bar4:Point("CENTER", TukuiBar1, "CENTER", 0, 0)
Bar4:SetWidth((P.buttonsize * 12) + (P.buttonspacing * 13))
Bar4:SetHeight((P.buttonsize * 2) + (P.buttonspacing * 3))
Bar4:HideInsets()
Bar4:SetBackdropBorderColor(0, 0, 0, 0)
Bar4:SetBackdrop(nil)

if Bar4:IsShown() then
	TukuiBar1:SetHeight((P.buttonsize * 2) + (P.buttonspacing * 3))
end

Bar4:HookScript("OnHide", function()
	TukuiBar1:SetHeight((P.buttonsize * 1) + (P.buttonspacing * 2))
end)

Bar4:HookScript("OnShow", function()
	TukuiBar1:SetHeight((P.buttonsize * 2) + (P.buttonspacing * 3))
end)

TukuiBar4:SetAlpha(0)
TukuiBar4Button:ClearAllPoints()

local bar = Bar4
bar:SetAlpha(1)
MultiBarLeft:SetParent(bar)

for i= 1, 12 do
	local b = _G["MultiBarLeftButton"..i]
	local b2 = _G["MultiBarLeftButton"..i-1]
	b:SetSize(P.buttonsize, P.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("TOPLEFT", bar, P.buttonspacing, -P.buttonspacing)
	else
		b:SetPoint("LEFT", b2, "RIGHT", P.buttonspacing, 0)
	end
	
	Bar4["Button"..i] = b
end
