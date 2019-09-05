local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local ActionBars =  T["ActionBars"]
local Num = NUM_ACTIONBAR_BUTTONS

local baseCreateBar4 = ActionBars.CreateBar4

function ActionBars:CreateBar4()
    -- Call the base function first
    baseCreateBar4(self)
	
	--- Then my stuff
    local Size = C["ActionBars"]["NormalButtonSize"]
    local Spacing = C["ActionBars"]["ButtonSpacing"]
    local ActionBar4 = Panels.ActionBar4
    local ActionBar1 = Panels.ActionBar1
	
	ActionBar4.Backdrop:Kill()
	ActionBar4.Backdrop.Shadow:Kill()

    local Bar4 = CreateFrame("Frame", "PatBar4", UIParent, "SecureHandlerStateTemplate")
	Bar4:Point("BOTTOMRIGHT", ActionBar1, "BOTTOMLEFT", -3, 0)
	Bar4:Width((Size * 4) + (Spacing * 5))
	Bar4:Height((Size * 3) + (Spacing * 4))
	Bar4:SetTemplate("Transparent")
	Bar4:SetFrameLevel(ActionBar1:GetFrameLevel())
	Bar4:SetFrameStrata(ActionBar1:GetFrameStrata())
	Bar4:CreateShadow()

	local bar = Bar4
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
		elseif i == 5 then
			b:SetPoint("BOTTOMLEFT", bar, Spacing, 34)
		elseif i == 9 then
			b:SetPoint("TOPLEFT", bar, Spacing, -Spacing)
		else
			b:SetPoint("LEFT", b2, "RIGHT", Spacing, 0)
		end
    end
end