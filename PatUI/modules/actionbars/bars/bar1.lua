local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local ActionBars = T["ActionBars"]
local Num = NUM_ACTIONBAR_BUTTONS

local baseCreateBar1 = ActionBars.CreateBar1
local baseCreatePetBar = ActionBars.CreatePetBar

function ActionBars:CreateBar1()
    -- Call the base function first
    baseCreateBar1(self)
	
	--- Then my stuff
	local Size = C["ActionBars"]["NormalButtonSize"]
	local Spacing = C["ActionBars"]["ButtonSpacing"]
	local ActionBar1 = TukuiActionBar1

	ActionBar1.Shadow:Kill()

	ActionBar1:ClearAllPoints()
	ActionBar1:SetPoint("CENTER", UIParent, "CENTER", -0.5, -184)
	ActionBar1:SetSize((Size * 10) + 37, 40)
	ActionBar1.Backdrop:SetBackdropColor(.28, .28, .28)
	ActionBar1.Backdrop:SetFrameStrata("BACKGROUND")

	ActionBar1:RegisterEvent("PLAYER_ENTERING_WORLD")
	ActionBar1:SetScript("OnEvent", function(self, event, unit, ...)
		if (event == "PLAYER_ENTERING_WORLD") then
			for i = 1, Num do
				local Button = _G["ActionButton"..i]
				local Previous = _G["ActionButton"..i-1]
				Button:SetSize(Size, Size)
				Button:ClearAllPoints()
				Button:SetParent(self)
				Button:SetAttribute("showgrid", 1)
				ActionButton_ShowGrid(Button)

				ActionBars:SkinButton(Button)

				if (i == 1) then
					Button:SetPoint("BOTTOMLEFT", ActionBar1, 5, 5)
				else
					Button:SetPoint("LEFT", Previous, "RIGHT", Spacing, 0)
				end

				if (i == 11 or i == 12) then
					Button:SetAlpha(0)
				end
			end
		end
	end)
end

function ActionBars:CreatePetBar()
	-- Call the base function first
    baseCreatePetBar(self)
	
	--- Then my stuff
	local PetSize = C.ActionBars.PetButtonSize
	local Spacing = C.ActionBars.ButtonSpacing
	local PetBar = TukuiPetActionBar
	
	PetBar:ClearAllPoints()
	PetBar:SetPoint("BOTTOM", UIParent, "BOTTOM", -0.5, 42)
	PetBar:SetWidth((PetSize * 10) + (Spacing * 11) + 4)
	PetBar:SetHeight((PetSize * 1) + (Spacing * 2) + 4)

	PetBar.Backdrop:SetBackdropColor(.28, .28, .28)

	for i = 1, NUM_PET_ACTION_SLOTS do
		local Button = _G["PetActionButton"..i]
		local PreviousButton = _G["PetActionButton"..i-1]
		
		Button:SetParent(PetBar)
		Button:ClearAllPoints()
		Button:SetSize(PetSize, PetSize)
		Button:SetNormalTexture("")
		Button:Show()

		if (i == 1) then
			Button:SetPoint("LEFT", PetBar, 5, 0)
		else
			Button:SetPoint("LEFT", PreviousButton, "RIGHT", Spacing, 0)

			PetBar:SetAttribute("addchild", Button)
		end
	end
end