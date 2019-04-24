local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local ActionBars =  T["ActionBars"]
local Num = NUM_ACTIONBAR_BUTTONS

hooksecurefunc(ActionBars, 'CreateBar4', function()
    local Size = C["ActionBars"]["NormalButtonSize"]
    local Spacing = C["ActionBars"]["ButtonSpacing"]
    local ActionBar4 = Panels.ActionBar4
    local ActionBar1 = Panels.ActionBar1
	
	ActionBar4.Backdrop:Kill()
	ActionBar4.Backdrop.Shadow:Kill()

    local LeftBar4 = CreateFrame("Frame", "LeftBar4", UIParent, "SecureHandlerStateTemplate")
	LeftBar4:Point("BOTTOMRIGHT", ActionBar1, "BOTTOMLEFT", -6, 0)
	LeftBar4:Width((Size * 3) + (Spacing * 4))
	LeftBar4:Height((Size * 2) + (Spacing * 3))
	LeftBar4:SetTemplate("Transparent")
	LeftBar4:SetFrameLevel(ActionBar1:GetFrameLevel())
	LeftBar4:SetFrameStrata(ActionBar1:GetFrameStrata())
	LeftBar4:CreateShadow()

	local RightBar4 = CreateFrame("Frame", "RightBar4", UIParent, "SecureHandlerStateTemplate")
	RightBar4:Point("BOTTOMLEFT", ActionBar1, "BOTTOMRIGHT", 6, 0)
	RightBar4:Width((Size * 3) + (Spacing * 4))
	RightBar4:Height((Size * 2) + (Spacing * 3))
	RightBar4:SetTemplate("Transparent")
	RightBar4:SetFrameLevel(ActionBar1:GetFrameLevel())
	RightBar4:SetFrameStrata(ActionBar1:GetFrameStrata())
	RightBar4:CreateShadow()

	local bar = LeftBar4
	local bar2 = RightBar4
    MultiBarRight:SetParent(bar)

    for i= 1, Num do
        local b = _G["MultiBarRightButton"..i]
        local b2 = _G["MultiBarRightButton"..i-1]
        b:SetSize(Size, Size)
        b:ClearAllPoints()
        b:SetFrameStrata("BACKGROUND")
        b:SetFrameLevel(15)

        if i == 1 then
			b:SetPoint("BOTTOMLEFT", bar, Spacing, Spacing)
		elseif i == 7 then
			b:SetPoint("TOPLEFT", bar, Spacing, -Spacing)
		elseif i == 4 then
			b:SetPoint("BOTTOMLEFT", bar2, Spacing, Spacing)
		elseif i == 10 then
			b:SetPoint("TOPLEFT", bar2, Spacing, -Spacing)
		else
			b:SetPoint("LEFT", b2, "RIGHT", Spacing, 0)
		end
    end
end)