local T, C, L = Tukui:unpack()

local Bags = T["Inventory"]["Bags"]
local Loot = T["Inventory"]["Loot"]
local Chat = T["Chat"]

local baseCreateContainer = Bags.CreateContainer
local baseSkinBagButton = Bags.SkinBagButton
local baseSlotUpdate = Bags.SlotUpdate
local baseCreateReagentContainer = Bags.CreateReagentContainer

local baseEnable = Loot.Enable
local baseCreateSlots = Loot.CreateSlots

local BlizzardBags = {
	CharacterBag0Slot,
	CharacterBag1Slot,
	CharacterBag2Slot,
	CharacterBag3Slot,
}

function Bags:CreateContainer(storagetype, ...)
	-- Call the base function first
	baseCreateContainer(self, storagetype, ...)
	
	-- Then my stuff
	local Container = self[storagetype]
	local LeftChatBG = Chat.LeftChatBG
	local Sort = Container.SortButton
	local SearchBox = Container.SearchBox
	local Purchase = BankFramePurchaseInfo
	local PurchaseButton = BankFramePurchaseButton
	local BagsContainer = Container.BagsContainer
	local BankBagsContainer = Container.BagsContainer

	Container.Backdrop:Kill()

	Container:PatUI("Transparent")
	Container.Backdrop:SetBackdropBorderColor(0, 0, 0)
	Container.Shadow:SetOutside(Container.Backdrop, 6, 6)

	Container:SetFrameLevel(10)
	
	Sort:CreateBackdrop("Transparent")
		
	-- bag anchor
	if (storagetype == "Bag") then
		Container:ClearAllPoints()
		Container:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -22, 10)
		
		BagsContainer.Backdrop:Kill()

		BagsContainer:PatUI("Transparent", "Single")
		BagsContainer.Backdrop:SetBackdropBorderColor(0, 0, 0)
		BagsContainer:ClearAllPoints()
		BagsContainer:SetPoint("BOTTOMRIGHT", Container, "TOPRIGHT", 0, 4)
		
		for _, Button in pairs(BlizzardBags) do
			local Icon = _G[Button:GetName().."IconTexture"]
			local Count = _G[Button:GetName().."Count"]
			
			Button:PatUI(nil, "Single")
			Button:HookScript("OnLeave", function() Button.Backdrop:SetBorderColor(unpack(C["PatUI"]["BorderColor"])) end)

			Icon:SetInside(Button, 1, 1)
		end
	end
	
	-- bank anchor
	if (storagetype == "Bank") then
		Container:ClearAllPoints()
		Container:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 22, 10)
	end	
end

function Bags:SkinBagButton()
	baseSkinBagButton(self)
	
	local Icon = _G[self:GetName().."IconTexture"]
	local Count = _G[self:GetName().."Count"]
	
	self.Backdrop:Kill()

	self:PatUI("Transparent", "Single")
	self.Backdrop:SetBackdropBorderColor(0, 0, 0)
	Icon:SetInside(self, 1, 1)

	Count:ClearAllPoints()
	Count:SetPoint("BOTTOM", 5, 3)
	Count:SetFont("Interface\\AddOns\\PatUI\\media\\fonts\\pixelfont.ttf", 10, "MONOCHROMEOUTLINE")
end

function Bags:SlotUpdate(id, button)
	baseSlotUpdate(self, id, button)
	
	local _, _, _, Rarity, _, _, ItemLink, _, _, ItemID, IsBound = GetContainerItemInfo(id, button:GetID())
	local QuestItem = false

	if button.Quest then
		button.Quest:Hide()
	end

	button.ItemID = ItemID

	if C.Bags.IdentifyQuestItems and QuestItem then
		button.Backdrop:SetBorderColor(1, .30, .30)
	else
		if Rarity then
			button.Backdrop:SetBorderColor(GetItemQualityColor(Rarity))
		else
			button.Backdrop:SetBorderColor(unpack(C["PatUI"]["BorderColor"]))
		end
	end
end

-- reagent bank anchor
function Bags:CreateReagentContainer()
	-- Call the base function first
	baseCreateReagentContainer(self)
	
	-- Then my stuff
	local Reagent = self.Reagent
	local LeftChatBG = Chat.LeftChatBG

	Reagent.Backdrop:Kill()
	
	Reagent:PatUI("Transparent")
	Reagent.Backdrop:SetBackdropBorderColor(0, 0, 0)

	Reagent:CreateThinShadow()
	Reagent.Shadow:SetOutside(Reagent.Backdrop, 5, 5)

	Reagent:ClearAllPoints()
	Reagent:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 22, 10)

	for i = 1, 98 do
		local Button = _G["ReagentBankFrameItem"..i]

		Button.Backdrop:Kill()

		Button:PatUI("Transparent", "Single")
		Button.Backdrop:SetBackdropBorderColor(0, 0, 0)
	end
end

function Loot:Enable()
	baseEnable(self)
	
	TukuiLootFrame.Overlay:PatUI("Transparent")
end

function Loot:CreateSlots(id)
	baseCreateSlots(self, id)
	
	local frame = TukuiLootFrame.LootSlots[id]
	local iconFrame = frame.iconFrame
	local icon = frame.icon

	frame.Backdrop:Kill()
	
	frame:PatUI("Transparent")
	frame.Backdrop:SetBackdropBorderColor(0, 0, 0)
	iconFrame:PatUI()
	iconFrame:SetFrameLevel(frame:GetFrameLevel())
	
	return frame
end