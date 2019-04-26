local T, C, L = Tukui:unpack()

local Bags = T["Inventory"]["Bags"]
local Panels = T["Panels"]

local function CreateContainer(self, storagetype, ...)
	local Container = self[storagetype]
	local LeftChatBG = Panels.LeftChatBG
	local Sort = Container.SortButton

	Container:SetTemplate("Transparent")
	Container:SetFrameLevel(10)
	
	Sort:SetTemplate("Transparent")
		
	-- bag anchor
	if (storagetype == "Bag") then
		Container:ClearAllPoints()
		Container:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 4)
	end
	
	-- bank anchor
	if (storagetype == "Bank") then
		Container:ClearAllPoints()
		Container:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 4, 4)
	end	
end
hooksecurefunc(Bags, "CreateContainer", CreateContainer)

-- reagent bank anchor
local function CreateReagentContainer(self)
	local Reagent = self.Reagent
	local LeftChatBG = Panels.LeftChatBG
	
	Reagent:SetTemplate("Transparent")

	Reagent:ClearAllPoints()
	Reagent:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 4, 4)
end
hooksecurefunc(Bags, "CreateReagentContainer", CreateReagentContainer)
