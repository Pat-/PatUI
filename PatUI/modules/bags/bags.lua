local T, C, L = Tukui:unpack()

local Bags = T["Inventory"]["Bags"]
local Panels = T["Panels"]

local baseCreateContainer = Bags.CreateContainer
local baseCreateReagentContainer = Bags.CreateReagentContainer

function Bags:CreateContainer(storagetype, ...)
	-- Call the base function first
	baseCreateContainer(self, storagetype, ...)
	
	-- Then my stuff
	local Container = self[storagetype]
	local LeftChatBG = Panels.LeftChatBG

	Container:SetTemplate("Transparent")
	Container:SetFrameLevel(10)

		
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
