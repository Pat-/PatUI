local T, C, L = Tukui:unpack()

local ActionBars = T["ActionBars"]

local baseSkinButton = ActionBars.SkinButton
local baseSkinPetButtons = ActionBars.SkinPetButtons
local baseSkinStanceButtons = ActionBars.SkinStanceButtons

function ActionBars:SkinButton()
	baseSkinButton(self)
	
	local Button = self
	
	if C["PatUI"]["ThickBorders"] == true then
		Button:PatUI()
		Button:SetBorderColor(.2, .2, .2)
	end
end

function ActionBars:SkinPetButtons()
	baseSkinPetButtons(self)
	
	for i = 1, NUM_PET_ACTION_SLOTS do
		local Name = "PetActionButton"..i
		local Button = _G[Name]
		
		if C["PatUI"]["ThickBorders"] == true then
			Button:PatUI()
			Button:SetBorderColor(.2, .2, .2)
		end
	end
end

function ActionBars:SkinStanceButtons()
	baseSkinStanceButtons(self)
	
	for i=1, NUM_STANCE_SLOTS do
		local Name = "StanceButton"..i
		local Button = _G[Name]
		
		if C["PatUI"]["ThickBorders"] == true then
			Button:PatUI()
			Button:SetBorderColor(.2, .2, .2)
		end
	end
end