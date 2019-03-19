local T, C, L = Tukui:unpack()

local Panels = T.Panels
local ActionBars = T.ActionBars

hooksecurefunc(ActionBars, 'CreateStanceBar', function()
	local Size = C.ActionBars.NormalButtonSize
	local Spacing = C.ActionBars.ButtonSpacing
	local StanceBar = Panels.StanceBar
	local LeftChatBG = Panels.LeftChatBG

	StanceBar:ClearAllPoints()
	StanceBar:SetPoint("TOPLEFT", LeftChatBG, "TOPLEFT", -1, 84)
end)