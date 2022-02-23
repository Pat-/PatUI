local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local ActionBars =  T["ActionBars"]
local Num = NUM_ACTIONBAR_BUTTONS

local baseCreateBar4 = ActionBars.CreateBar4

function ActionBars:CreateBar4()
    -- Call the base function first
    baseCreateBar4(self)

    if not C.ActionBars.RightBar then
		MultiBarRight:SetShown(false)

		return
	end
	
	--- Then my stuff
    local Size = C["ActionBars"]["NormalButtonSize"]
    local Spacing = C["ActionBars"]["ButtonSpacing"]
    local TabsLeft = T.Chat.Panels and T.Chat.Panels.LeftChatTabs

    TukuiActionBar4:ClearAllPoints()
	TukuiActionBar4:SetPoint("BOTTOM", TabsLeft, "TOP", -0.5, 4)
	TukuiActionBar4:SetSize((Size * 12) + (Spacing * 13) + 4, 33)
	TukuiActionBar4:SetAlpha(0)
    TukuiActionBar4.Backdrop:SetBackdropColor(.28, .28, .28)

	TukuiActionBar4:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	TukuiActionBar4:SetScript("OnLeave", function(self) self:SetAlpha(0) end)

	local bar = TukuiActionBar4
    MultiBarRight:SetParent(bar)

    for i= 1, Num do
        local b = _G["MultiBarRightButton"..i]
        local b2 = _G["MultiBarRightButton"..i-1]
        b:SetSize(Size, Size)
        b:ClearAllPoints()
        b:SetFrameStrata("BACKGROUND")
        b:SetFrameLevel(15)
        b:SetAttribute("showgrid", 1)

        b:HookScript("OnEnter", function() bar:SetAlpha(1) end)
        b:HookScript("OnLeave", function() bar:SetAlpha(0) end)

        if i == 1 then
            b:SetPoint("LEFT", bar, 5, 0)
        else
            b:SetPoint("LEFT", b2, "RIGHT", Spacing, 0)
        end
    end
end