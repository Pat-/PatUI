local T, C, L = Tukui:unpack() 

local Tooltips = T["Tooltips"]
local Inventory = T["Inventory"]
local Panels = T["Panels"]
local Bags = Inventory["Bags"]

local baseOpenAllBags = Bags.OpenAllBags
local baseCloseAllBags = Bags.CloseAllBags
local baseCreateAnchor = Tooltips.CreateAnchor
local baseOnTooltipSetUnit = Tooltips.OnTooltipSetUnit


-- Bags load first in Tukui
-- so we override the bag functions only after tooltips get created
-- This allows us to change the position of the tooltip anchor to on top of bag frames when they open
function Tooltips:CreateAnchor()
	-- Call the base function first
	baseCreateAnchor(self)
	
	-- Make sure tooltip Anchors to where we want it before we override bag functions
	local Anchor = Tooltips["Anchor"]
	local RightChat = Panels["RightChatBG"]
	
	if C["PatUI"]["SmallerChat"] then
		Anchor:ClearAllPoints()
		Anchor:SetPoint("BOTTOMRIGHT", RightChat, "TOPRIGHT", 0, -25)
	end
	
	-- Override OpenAllBags
	function Bags:OpenAllBags()
		-- Call the base function first
		baseOpenAllBags(self);

		-- Change the Tooltip Anchor When the Bags Get Opened
		if C["PatUI"]["SmallerChat"] then
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
		if C["PatUI"]["SmallerChat"] then
			local Anchor = Tooltips["Anchor"]
			local RightChat = Panels["RightChatBG"]
			
			Anchor:ClearAllPoints()
			Anchor:SetPoint("BOTTOMRIGHT", RightChat, "TOPRIGHT", 0, -25)
		end
	end
end

if C["PatUI"]["CombatHide"] == true then
	GameTooltip:HookScript("OnShow", function(self)
		if InCombatLockdown() then
			self:Hide()
		end
	end)
end

-- Astral Keys causes a Lua error because it edits tooltips like Tukui
if C["PatUI"]["HideTarget"] == true  then
	-- Cleverly construct a sandbox for our friends at Tukui (experimental and buggy)
	local sandbox_env = {

		-- Notes:
		--   Put functions in here that you want to rewrite
		--   They can even be secure functions! Since we aren't
		--   actually tainting any functions, only preventing
		--   them from running

		-- Modify the behavior of UnitExists
		UnitExists = function (unit)
			-- Targets of Units DO NOT EXIST
			if unit:match("target$") then
				return
			end
			return UnitExists(unit)
		end
	}

	-- Add All the Global Stuff to Our Sandbox
	sandbox_env = setmetatable(sandbox_env, { __index = _G })

	function Tooltips:OnTooltipSetUnit()
		-- Call the base function (from Inside a Sandbox)
		setfenv(baseOnTooltipSetUnit, sandbox_env)
		baseOnTooltipSetUnit(self)

		-- In this case, the sandbox will do all the work, but you can add any other code below
	end
end
-- Dandraffbal helped with all this

