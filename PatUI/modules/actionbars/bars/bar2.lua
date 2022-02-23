local T, C, L = Tukui:unpack()

local ActionBars =  T["ActionBars"]
local Num = NUM_ACTIONBAR_BUTTONS

local baseCreateBar2 = ActionBars.CreateBar2

function ActionBars:CreateBar2()
    -- Call the base function first
    baseCreateBar2(self)

    if not C.ActionBars.BottomLeftBar then
		MultiBarBottomLeft:SetShown(false)
		
		return
	end
	
	--- Then my stuff
	local Size = C["ActionBars"]["NormalButtonSize"]
	local Spacing = C["ActionBars"]["ButtonSpacing"]
	local ActionBar2 = TukuiActionBar2

	TukuiActionBar2:ClearAllPoints()
	TukuiActionBar2:SetPoint("BOTTOM", UIParent, "BOTTOM", -0.5, 7)
	TukuiActionBar2:SetSize((Size * 24) + (Spacing * 25) + 4, (Size * 2) + (Spacing * 3) - 22)
	TukuiActionBar2.Backdrop:SetBackdropColor(.28, .28, .28)

	local bar = TukuiActionBar2
	MultiBarBottomLeft:SetParent(TukuiActionBar2)

	-- setup the bar
	for i=1, Num do
		local b = _G["MultiBarBottomLeftButton"..i]
		local b2 = _G["MultiBarBottomLeftButton"..i-1]
		b:SetSize(Size, Size)
		b:ClearAllPoints()
		b:SetFrameStrata("BACKGROUND")
		b:SetFrameLevel(15)
		b:SetAttribute("showgrid", 1)
		
		if i == 1 then
			b:SetPoint("LEFT", bar, 5, 0)
		else
			b:SetPoint("LEFT", b2, "RIGHT", Spacing, 0)
		end
	end
end