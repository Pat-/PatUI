local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local ActionBars =  T["ActionBars"]
local Num = NUM_ACTIONBAR_BUTTONS


local baseCreateBar3 = ActionBars.CreateBar3

function ActionBars:CreateBar3()
    -- Call the base function first
    baseCreateBar3(self)
	
	--- Then my stuff
	local Size = C["ActionBars"]["NormalButtonSize"]
	local Spacing = C["ActionBars"]["ButtonSpacing"]
	local ActionBar3 = Panels.ActionBar3
	local ActionBar1 = Panels.ActionBar1
	
	ActionBar3.Backdrop:SetAlpha(0)
	ActionBar3.Backdrop.Shadow:Kill()
	
	local Bar3 = CreateFrame("Frame", "PatBar3", UIParent, "SecureHandlerStateTemplate")
	Bar3:Point("CENTER", ActionBar1, "CENTER", 0, 45)
	Bar3:SetWidth((Size * 12) + (Spacing * 13))
	Bar3:SetHeight((Size * 2) + (Spacing * 3))
	
	local bar = Bar3
	MultiBarBottomRight:SetParent(bar)

	-- setup the bar
	for i=1, Num do
		local b = _G["MultiBarBottomRightButton"..i]
		local b2 = _G["MultiBarBottomRightButton"..i-1]
		b:SetSize(Size, Size)
		b:ClearAllPoints()
		b:SetFrameStrata("BACKGROUND")
		b:SetFrameLevel(15)
		
		if i == 1 then
			b:SetPoint("TOPLEFT", bar, Spacing, -Spacing)
		else
			b:SetPoint("LEFT", b2, "RIGHT", Spacing, 0)
		end
	end
end