local T, C, L = Tukui:unpack()

local Bags = T["Inventory"]["Bags"]

local function CreateContainer(self, storagetype, ...)
local Container = self[storagetype]

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
hooksecurefunc(Bags, "CreateContainer", CreateContainer)


-- reagent bank anchor
local function CreateReagentContainer(self)
local Reagent = self.Reagent
	
	Reagent:SetTemplate("Transparent")

	Reagent:ClearAllPoints()
	Reagent:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 4, 4)

end
hooksecurefunc(Bags, "CreateReagentContainer", CreateReagentContainer)
