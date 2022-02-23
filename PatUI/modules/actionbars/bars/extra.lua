local T, C, L = Tukui:unpack()

local ActionBars = T["ActionBars"]

local Button = ExtraActionButton1

local baseSetupExtraButton = ActionBars.SetupExtraButton

function ActionBars:SetupExtraButton()
	baseSetupExtraButton(self)

    TukuiExtraActionButton:ClearAllPoints()
    TukuiExtraActionButton:SetPoint("TOP", 0, -50)

    Button:PatUI()
end