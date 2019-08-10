local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local ActionBars = T["ActionBars"]

local baseCreateStanceBar = ActionBars.CreateStanceBar

function ActionBars:CreateStanceBar()
    -- Call the base function first
    baseCreateStanceBar(self)
	
	--- Then my stuff
	local Size = C["ActionBars"]["NormalButtonSize"]
	local Spacing = C["ActionBars"]["ButtonSpacing"]
	local StanceBar = Panels.StanceBar
	local LeftChatBG = Panels.LeftChatBG

	StanceBar:ClearAllPoints()
	StanceBar:SetPoint("TOPLEFT", LeftChatBG, "TOPLEFT", -1, 84)
end