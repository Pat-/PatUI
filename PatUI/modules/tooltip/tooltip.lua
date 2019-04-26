local T, C, L = Tukui:unpack()

local Tooltips = T["Tooltips"]
local Inventory = T["Inventory"]
local Panels = T["Panels"]
local Bags = Inventory["Bags"]

local baseOpenAllBags = Bags.OpenAllBags
local baseCloseAllBags = Bags.CloseAllBags
local baseCreateAnchor = Tooltips.CreateAnchor


-- Bags load first in Tukui
-- so we override the bag functions only after tooltips get created
-- This allows us to change the position of the tooltip anchor to on top of bag frames when they open
function Tooltips:CreateAnchor()
	-- Call the base function first
	baseCreateAnchor(self)
	
	-- Make sure tooltip Anchors to where we want it before we override bag functions
	local Anchor = Tooltips["Anchor"]
	local RightChat = Panels["RightChatBG"]
	
	if C["General"]["SmallerChat"] then
		Anchor:ClearAllPoints()
		Anchor:SetPoint("BOTTOMRIGHT", RightChat, "TOPRIGHT", 0, -25)
	end
	
	-- Override OpenAllBags
	function Bags:OpenAllBags()
		-- Call the base function first
		baseOpenAllBags(self);

		-- Change the Tooltip Anchor When the Bags Get Opened
		if C["General"]["SmallerChat"] then
			local Anchor = Tooltips["Anchor"]
			local Container = _G["TukuiBag"]
			
			Anchor:ClearAllPoints()
			Anchor:SetPoint("BOTTOMRIGHT", Container, "TOPRIGHT", 0, 0)
		end
	end

	-- Override CloseAllBags
	function Bags:CloseAllBags()
		-- Call the base function first
		baseCloseAllBags(self);

		-- Change the Tooltip Anchor Back When the Bags Get Closed
		if C["General"]["SmallerChat"] then
			local Anchor = Tooltips["Anchor"]
			local RightChat = Panels["RightChatBG"]
			
			Anchor:ClearAllPoints()
			Anchor:SetPoint("BOTTOMRIGHT", RightChat, "TOPRIGHT", 0, -25)
		end
	end
end

GameTooltip:HookScript("OnShow", function(self)
	if InCombatLockdown() then
		self:Hide()
	end
end)
