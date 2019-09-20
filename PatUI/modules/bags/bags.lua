local T, C, L = Tukui:unpack()

local Bags = T["Inventory"]["Bags"]
local Panels = T["Panels"]
local Loot = T["Inventory"]["Loot"]

local baseCreateContainer = Bags.CreateContainer
local baseSkinBagButton = Bags.SkinBagButton
local baseSlotUpdate = Bags.SlotUpdate
local baseEnable = Loot.Enable
local baseCreateSlots = Loot.CreateSlots

function Bags:CreateContainer(storagetype, ...)
	-- Call the base function first
	baseCreateContainer(self, storagetype, ...)
	
	-- Then my stuff
	local Container = self[storagetype]
	local RightChatBG = Panels.RightChatBG
	local LeftChatBG = Panels.LeftChatBG

	Container:SetBackdropColor(0.1, 0.1, 0.1, 0.5)
	Container:SetFrameLevel(10)
	
	if C["PatUI"]["ThickBorders"] == true then
		local bg = CreateFrame("Frame", nil, Container)
		bg:SetFrameLevel(Container:GetFrameLevel() - 1)
		bg:SetFrameStrata(Container:GetFrameStrata())
		bg:Size(1, 1)
		bg:Point("TOPLEFT", Container, -1.5, 1.5)
		bg:Point("BOTTOMRIGHT", Container, 1.5, -1.5)
		bg:PatUI("Transparent")
		bg:CreateShadow()
		
		Container.Shadow:Kill()
	end
	
	-- bag anchor
	if (storagetype == "Bag") then
		if C["PatUI"]["DisableRight"] == true then
			Container:ClearAllPoints()
			Container:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 4)
		elseif C["PatUI"]["ThickBorders"] == true then
			Container:ClearAllPoints()
			Container:SetPoint("BOTTOMRIGHT", RightChatBG, "TOPRIGHT", -1, 16)
		else
			Container:ClearAllPoints()
			Container:SetPoint("BOTTOMRIGHT", RightChatBG, "TOPRIGHT", 0, 14)
		end
	end
	
	-- bank anchor
	if (storagetype == "Bank") then
		if C["PatUI"]["ThickBorders"] == true then
			Container:ClearAllPoints()
			Container:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 1, 4)
		else
			Container:ClearAllPoints()
			Container:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 0, 4)
		end
	end	
end

function Bags:SkinBagButton()
	baseSkinBagButton(self)
	
	if C["PatUI"]["ThickBorders"] == true then
		local bg = CreateFrame("Frame", nil, self)
		bg:SetFrameLevel(self:GetFrameLevel() - 1)
		bg:SetFrameStrata(self:GetFrameStrata())
		bg:Size(1, 1)
		bg:Point("TOPLEFT", self, -1.5, 1.5)
		bg:Point("BOTTOMRIGHT", self, 1.5, -1.5)
		bg:PatUI()
	end
end

function Loot:Enable()
	baseEnable(self)
	
	if C["PatUI"]["ThickBorders"] == true then
		TukuiLootFrame.Overlay:PatUI("Transparent")
	end
end

--[[
function Loot:CreateSlots()
	baseCreateSlots(id)
	
	local frame = TukuiLootFrame.LootSlots[id]
	
	if C["PatUI"]["ThickBorders"] == true then
		frame:PatUI("Transparent")
	end
end
]]--