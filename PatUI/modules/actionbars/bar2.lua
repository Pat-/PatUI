local T, C, L = Tukui:unpack()

local Panels = T.Panels
local ActionBars = T.ActionBars
local Num = NUM_ACTIONBAR_BUTTONS


hooksecurefunc(ActionBars, 'CreateBar2', function()
	local Size = C.ActionBars.NormalButtonSize
	local Spacing = C.ActionBars.ButtonSpacing
	local ActionBar1 = Panels.ActionBar1
	local ActionBar2 = Panels.ActionBar2

	ActionBar2.Backdrop:SetAlpha(0)

	local Bar2 = CreateFrame("Frame", "Bar2", UIParent, "SecureHandlerStateTemplate")
	Bar2:Point("CENTER", ActionBar1, "CENTER", 0, 16)
	Bar2:SetWidth((Size * 12) + (Spacing * 13))
	Bar2:SetHeight((Size * 2) + (Spacing * 3))
	Bar2:SetBackdropBorderColor(0, 0, 0, 0)
	Bar2:SetBackdrop(nil)
	
	local bar = Bar2
	MultiBarBottomLeft:SetParent(bar)

	-- setup the bar
	for i=1, Num do
		local b = _G["MultiBarBottomLeftButton"..i]
		local b2 = _G["MultiBarBottomLeftButton"..i-1]
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
end)