local T, C, L = Tukui:unpack()

local Tooltips = T["Tooltips"]
local Panels = T["Panels"]

local function CreateAnchor(self)
	local RightChat = Panels["RightChatBG"]
	local Anchor = Tooltips["Anchor"]
	local Tooltip = GameTooltip
	
	if C["General"]["SmallerChat"] == true then
		Anchor:ClearAllPoints()
		Anchor:SetPoint("BOTTOMRIGHT", RightChat, "TOPRIGHT", 0, -25)
	end
end
hooksecurefunc(Tooltips, "CreateAnchor", CreateAnchor)

GameTooltip:HookScript("OnShow", function(self)
	if InCombatLockdown() then
		self:Hide()
	end
end)


-- going to work on getting tooltip to toggle when bags are open so they're above bag frame not inside bag frame