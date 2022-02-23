local T, C, L = Tukui:unpack()

local Chat = T["Chat"]
local ActionBars = T["ActionBars"]

local baseCreateStanceBar = ActionBars.CreateStanceBar

function ActionBars:CreateStanceBar()
    -- Call the base function first
    baseCreateStanceBar(self)

    if (not C.ActionBars.ShapeShift) then
		return
	end
	
	--- Then my stuff
	local Size = C["ActionBars"]["NormalButtonSize"]
	local Spacing = C["ActionBars"]["ButtonSpacing"]
	local StanceBar = TukuiStanceBar
	local LeftChatBG = Chat.LeftChatBG

	StanceBar:ClearAllPoints()
	StanceBar:SetPoint("TOPLEFT", LeftChatBG, "TOPLEFT", -1, 84)
end