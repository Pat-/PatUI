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
	local LeftChatBG = Panels.LeftChatBG
	
	ActionBar3.Backdrop:SetAlpha(0)
	ActionBar3.Backdrop.Shadow:Kill()

	local buttonsize = 27.7

	local Bar3 = CreateFrame("Frame", "PatBar3", UIParent, "SecureHandlerStateTemplate")
	Bar3:Point("BOTTOM", LeftChatBG, "TOP", 0, 4)
	Bar3:Width((buttonsize * 12) + (Spacing * 13))
	Bar3:Height((buttonsize * 1) + (Spacing * 2))
	Bar3:SetFrameStrata("BACKGROUND")
	Bar3:SetFrameLevel(3)
	Bar3:SetTemplate("Transparent")
	Bar3:CreateShadow()

	local bar = Bar3
	MultiBarBottomRight:SetParent(bar)

	for i= 1, Num do
		local b = _G["MultiBarBottomRightButton"..i]
		local b2 = _G["MultiBarBottomRightButton"..i-1]
		b:SetSize(buttonsize, buttonsize)
		b:ClearAllPoints()
		b:SetFrameStrata("BACKGROUND")
		b:SetFrameLevel(15)
		
		if i == 1 then
			b:SetPoint("BOTTOMLEFT", bar, Spacing, Spacing)
		else
			b:SetPoint("LEFT", b2, "RIGHT", Spacing, 0)
		end
		
		Bar3["Button"..i] = b
	end
end