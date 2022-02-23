local T, C, L = Tukui:unpack()

local Chat = T.Chat
local ActionBars =  T["ActionBars"]
local Num = NUM_ACTIONBAR_BUTTONS

local baseCreateBar5 = ActionBars.CreateBar5

function ActionBars:CreateBar5()
    -- Call the base function first
    baseCreateBar5(self)

    if not C.ActionBars.LeftBar then
		MultiBarLeft:SetShown(false)

		return
	end
	
	--- Then my stuff
	local Size = C["ActionBars"]["NormalButtonSize"]
	local Spacing = C["ActionBars"]["ButtonSpacing"]
	local ActionBar5 = TukuiActionBar5

	ActionBar5.Backdrop:Kill()
	ActionBar5.Shadow:Kill()

	local LeftBar = CreateFrame("Frame", "PatLeftBar", UIParent, "SecureHandlerStateTemplate")
	LeftBar:SetPoint("LEFT", TukuiChatLeftBackground, "RIGHT", 4, 0)
	LeftBar:SetWidth((Size * 1 + 4) + (Spacing * 2))
	LeftBar:SetHeight((Size * 6 + 4) + (Spacing * 7))
	LeftBar:CreateBackdrop()
	LeftBar.Backdrop:SetBackdropColor(.28, .28, .28)
	LeftBar.Backdrop:SetFrameStrata("BACKGROUND")
	LeftBar.Backdrop:CreateThinShadow()

	local RightBar = CreateFrame("Frame", "PatRightBar", UIParent, "SecureHandlerStateTemplate")
	RightBar:SetPoint("RIGHT", TukuiChatRightBackground, "LEFT", -4, 0)
	RightBar:SetWidth((Size * 1 + 4) + (Spacing * 2))
	RightBar:SetHeight((Size * 6 + 4) + (Spacing * 7))
	RightBar:CreateBackdrop()
	RightBar.Backdrop:SetBackdropColor(.28, .28, .28)
	RightBar.Backdrop:SetFrameStrata("BACKGROUND")
	RightBar.Backdrop:CreateThinShadow()

	local bar = LeftBar
	local bar2 = RightBar
	MultiBarLeft:SetParent(bar)

	for i= 1, Num do
		local b = _G["MultiBarLeftButton"..i]
		local b2 = _G["MultiBarLeftButton"..i-1]
		
		b:SetSize(Size, Size)
		b:ClearAllPoints()
		b:SetFrameStrata("BACKGROUND")
		b:SetFrameLevel(15)
		b:SetAttribute("showgrid", 1)
		
		if i == 1 then
			b:SetPoint("TOPRIGHT", bar, -5, -5)
		elseif i == 7 then
			b:SetPoint("TOPRIGHT", bar2, -5, -5)
		else
			b:SetPoint("TOP", b2, "BOTTOM", 0, -Spacing)
		end
	end
end