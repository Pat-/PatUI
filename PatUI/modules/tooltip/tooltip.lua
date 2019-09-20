local T, C, L = Tukui:unpack() 

local Tooltips = T["Tooltips"]
local Inventory = T["Inventory"]
local Panels = T["Panels"]
local Bags = Inventory["Bags"]

local HealthBar = GameTooltipStatusBar

local baseOpenAllBags = Bags.OpenAllBags
local baseCloseAllBags = Bags.CloseAllBags
local baseCreateAnchor = Tooltips.CreateAnchor
local baseSetColor = Tooltips.SetColor
local baseSkin = Tooltips.Skin
local baseEnable = Tooltips.Enable

function Tooltips:SetColor()
	-- First call the base function
	baseSetColor(self)

	if C["PatUI"]["ThickBorders"] then return end
	
	self.Backdrop:SetBackdropColor(.1, .1, .1, .8)
end

-- Bags load first in Tukui
-- so we override the bag functions only after tooltips get created
-- This allows us to change the position of the tooltip anchor to on top of bag frames when they open
function Tooltips:CreateAnchor()
	-- Call the base function first
	baseCreateAnchor(self)
	
	-- Make sure tooltip Anchors to where we want it before we override bag functions
	local Anchor = Tooltips["Anchor"]
	local RightChat = Panels["RightChatBG"]
	
	if C["PatUI"]["DisableRight"] == true then
		Anchor:ClearAllPoints()
		Anchor:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 0)
	else
		Anchor:ClearAllPoints()
		Anchor:SetPoint("BOTTOMRIGHT", RightChat, "TOPRIGHT", -2, -13)
	end
	
	-- Override OpenAllBags
	function Bags:OpenAllBags()
		-- Call the base function first
		baseOpenAllBags(self);

		-- Change the Tooltip Anchor When the Bags Get Opened
		local Anchor = Tooltips["Anchor"]
		local Container = _G["TukuiBag"]
		
		Anchor:ClearAllPoints()
		Anchor:SetPoint("BOTTOMRIGHT", Container, "TOPRIGHT", 0, -25)
	end

	-- Override CloseAllBags
	function Bags:CloseAllBags()
		-- Call the base function first
		baseCloseAllBags(self);

		-- Change the Tooltip Anchor Back When the Bags Get Closed
		local Anchor = Tooltips["Anchor"]
		local RightChat = Panels["RightChatBG"]
		
		if C["PatUI"]["DisableRight"] == true then
			Anchor:ClearAllPoints()
			Anchor:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 0)
		else
			Anchor:ClearAllPoints()
			Anchor:SetPoint("BOTTOMRIGHT", RightChat, "TOPRIGHT", -2, -13)
		end
	end
end

function Tooltips:Skin()
	baseSkin(self)
	--[[
	if C["PatUI"]["ThickBorders"] == true then		
		local bg = CreateFrame("Frame", nil, self)
		bg:Size(1, 1)
		bg:PatUI()
		bg:SetFrameLevel(self:GetFrameLevel() - 1)
		bg:SetFrameStrata(self:GetFrameStrata())
		bg:Point("TOPLEFT", self, -2, 2)
		bg:Point("BOTTOMRIGHT", self, 2, -2)
		
		--self.Shadow:Kill()
	end
	]]--
end

function Tooltips:Enable()
	baseEnable(self)
	--[[
	if not C["PatUI"]["ThickBorders"] then return end
	
	HealthBar.Backdrop.Shadow:Kill()
	
	local bg = CreateFrame("Frame", nil, HealthBar)
	bg:Size(1, 1)
	bg:PatUI()
	bg:SetFrameLevel(HealthBar:GetFrameLevel())
	bg:SetFrameStrata(HealthBar:GetFrameStrata())
	bg:Point("TOPLEFT", HealthBar, -2, 2)
	bg:Point("BOTTOMRIGHT", HealthBar, 2, -2)
	
	HealthBar:ClearAllPoints()
	HealthBar:Point("BOTTOMLEFT", HealthBar:GetParent(), "TOPLEFT", 0, 7)
	HealthBar:Point("BOTTOMRIGHT", HealthBar:GetParent(), "TOPRIGHT", 0, 7)
	]]--
end