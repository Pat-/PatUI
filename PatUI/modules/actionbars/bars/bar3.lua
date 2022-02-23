local T, C, L = Tukui:unpack()

local Chat = T["Chat"]
local ActionBars =  T["ActionBars"]
local Num = NUM_ACTIONBAR_BUTTONS

local baseCreateBar3 = ActionBars.CreateBar3

function ActionBars:CreateBar3()
    -- Call the base function first
    baseCreateBar3(self)

    if not C.ActionBars.BottomRightBar then
		MultiBarBottomRight:SetShown(false)
		
		return
	end
	
	--- Then my stuff
	local Size = C["ActionBars"]["NormalButtonSize"]
	local Spacing = C["ActionBars"]["ButtonSpacing"]
	
	TukuiActionBar3.Backdrop:Kill()
	TukuiActionBar3.Shadow:Kill()

	local bar = TukuiActionBar2
	MultiBarBottomRight:SetParent(bar)

	for i= 1, Num do
		local b = _G["MultiBarBottomRightButton"..i]
		local b2 = _G["MultiBarBottomRightButton"..i-1]
		b:SetSize(Size, Size)
		b:ClearAllPoints()
		b:SetFrameStrata("BACKGROUND")
		b:SetFrameLevel(15)
		b:SetAttribute("showgrid", 1)
		
		if i == 1 then
			b:SetPoint("LEFT", bar, 317, 0)
		else
			b:SetPoint("LEFT", b2, "RIGHT", Spacing, 0)
		end
	end
end