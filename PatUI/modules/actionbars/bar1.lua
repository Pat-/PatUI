local T, C, L = Tukui:unpack()

local Panels = T.Panels
local ActionBars = T.ActionBars
local Num = NUM_ACTIONBAR_BUTTONS

hooksecurefunc(ActionBars, 'CreateBar1', function()
	local Size = C.ActionBars.NormalButtonSize
	local Spacing = C.ActionBars.ButtonSpacing
	local ActionBar1 = Panels.ActionBar1

	ActionBar1.Backdrop:SetAlpha(0)
	ActionBar1:ClearAllPoints()
	ActionBar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 23)
	
	local Bar1 = CreateFrame("Frame", "Bar1", UIParent, "SecureHandlerStateTemplate")
	Bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 23)
	Bar1:SetWidth((Size * 12) + (Spacing * 13))
	Bar1:SetHeight((Size * 2) + (Spacing * 3))
	Bar1:SetTemplate("Transparent")
	
	ActionBar1:SetParent(Bar1)
end)
