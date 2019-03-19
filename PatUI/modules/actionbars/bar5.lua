local T, C, L = Tukui:unpack()

local Panels = T.Panels
local ActionBars = T.ActionBars
local Num = NUM_ACTIONBAR_BUTTONS

hooksecurefunc(ActionBars, 'CreateBar5', function()
	local Size = C.ActionBars.NormalButtonSize
	local Spacing = C.ActionBars.ButtonSpacing
	local ActionBar5 = Panels.ActionBar5
	local LeftChatBG = Panels.LeftChatBG
	local RightChatBG = Panels.RightChatBG

	ActionBar5.Backdrop:SetAlpha(0)

	local buttonsize = 25

	local LeftBar = CreateFrame("Frame", "LeftBar", UIParent, "SecureHandlerStateTemplate")
	LeftBar:Point("LEFT", LeftChatBG, "RIGHT", 4, 0)
	LeftBar:Width((buttonsize * 1) + (Spacing * 2))
	LeftBar:Height((buttonsize * 6) + (Spacing * 7))
	LeftBar:SetFrameStrata("BACKGROUND")
	LeftBar:SetFrameLevel(3)
	LeftBar:SetTemplate("Transparent")
	LeftBar:CreateShadow()

	local RightBar = CreateFrame("Frame", "RightBar", UIParent, "SecureHandlerStateTemplate")
	RightBar:Point("RIGHT", RightChatBG, "LEFT", -4, 0)
	RightBar:Width((buttonsize * 1) + (Spacing * 2))
	RightBar:Height((buttonsize * 6) + (Spacing * 7))
	RightBar:SetFrameStrata("BACKGROUND")
	RightBar:SetFrameLevel(3)
	RightBar:SetTemplate("Transparent")
	RightBar:CreateShadow()

	local bar = LeftBar
	local bar2 = RightBar
	MultiBarLeft:SetParent(bar)

	for i= 1, Num do
		local b = _G["MultiBarLeftButton"..i]
		local b2 = _G["MultiBarLeftButton"..i-1]
		b:SetSize(buttonsize, buttonsize)
		b:ClearAllPoints()
		b:SetFrameStrata("BACKGROUND")
		b:SetFrameLevel(15)
		
		if i == 1 then
			b:SetPoint("TOPRIGHT", bar, -Spacing, -Spacing)
		elseif i == 7 then
			b:SetPoint("TOPRIGHT", bar2, -Spacing, -Spacing)
		else
			b:SetPoint("TOP", b2, "BOTTOM", 0, -Spacing)
		end
	end
end)