local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local ActionBars = T["ActionBars"]

local baseCreatePetBar = ActionBars.CreatePetBar

function ActionBars:CreatePetBar()
	-- Call the base function first
    baseCreatePetBar(self)
	
	--- Then my stuff
	local PetBar = Panels.PetActionBar
	local Size = C["ActionBars"]["PetButtonSize"]
	local Spacing = C["ActionBars"]["ButtonSpacing"]
	
	PetBar:Kill()

	local BarPet = CreateFrame("Frame", "PatBarPet", UIParent, "SecureHandlerStateTemplate")
	BarPet:SetPoint("RIGHT", UIParent, "RIGHT", -4, 0)
	BarPet:SetWidth((Size) + (Spacing * 2))
	BarPet:SetHeight((Size * 10) + (Spacing * 11))
	BarPet:SetTemplate("Transparent")
	BarPet:CreateShadow()
	BarPet:SetFrameStrata("BACKGROUND")
	
	local bar = BarPet
	
	-- setup the bar
	for i=1, NUM_PET_ACTION_SLOTS do
		local b = _G["PetActionButton"..i]
		local b2 = _G["PetActionButton"..i-1]
		b:SetParent(bar)
		b:ClearAllPoints()
		b:SetFrameStrata("BACKGROUND")
		b:SetFrameLevel(15)
		
		if i == 1 then
			b:SetPoint("TOPLEFT", bar, Spacing, -Spacing)
		else
			b:SetPoint("TOP", b2, "BOTTOM", 0, -Spacing)
		end
	end
	
	RegisterStateDriver(bar, "visibility", "[pet] show; hide")
end