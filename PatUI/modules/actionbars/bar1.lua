local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local ActionBars = T["ActionBars"]
local Num = NUM_ACTIONBAR_BUTTONS

hooksecurefunc(ActionBars, 'CreateBar1', function()
	local Size = C["ActionBars"]["NormalButtonSize"]
	local Spacing = C["ActionBars"]["ButtonSpacing"]
	local ActionBar1 = Panels.ActionBar1

	ActionBar1.Backdrop:Kill()
	ActionBar1.Backdrop.Shadow:Kill()
	
	
	ActionBar1:ClearAllPoints()
	ActionBar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 23)
	
	local Bar1 = CreateFrame("Frame", "PatBar1", UIParent, "SecureHandlerStateTemplate")
	Bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 23)
	Bar1:SetWidth((Size * 12) + (Spacing * 13))
	Bar1:SetHeight((Size * 2) + (Spacing * 3))
	Bar1:SetTemplate("Transparent")
	Bar1:CreateShadow()
	
	ActionBar1:SetParent(Bar1)
end)

hooksecurefunc(ActionBars, 'CreatePetBar', function()
	local PetBar = Panels.PetActionBar
	
	PetBar:ClearAllPoints()
	PetBar:Point("RIGHT", UIParent, "RIGHT", -3, -14)
end)