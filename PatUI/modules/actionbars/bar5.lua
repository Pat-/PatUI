local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local ActionBars =  T["ActionBars"]
local Num = NUM_ACTIONBAR_BUTTONS

local baseCreateBar5 = ActionBars.CreateBar5

function ActionBars:CreateBar5()
    -- Call the base function first
    baseCreateBar5(self)
	
	--- Then my stuff
	local Size = C["ActionBars"]["NormalButtonSize"]
	local Spacing = C["ActionBars"]["ButtonSpacing"]
	local ActionBar5 = Panels.ActionBar5
	local ActionBar1 = Panels.ActionBar1
	local LeftChatBG = Panels.LeftChatBG
	local RightChatBG = Panels.RightChatBG

	ActionBar5.Backdrop:Kill()
	ActionBar5.Backdrop.Shadow:Kill()
	
	local Bar5 = CreateFrame("Frame", "PatBar5", UIParent, "SecureHandlerStateTemplate")
	Bar5:Point("BOTTOMLEFT", ActionBar1, "BOTTOMRIGHT", 3, 0)
	Bar5:Width((Size * 4) + (Spacing * 5))
	Bar5:Height((Size * 3) + (Spacing * 4))
	Bar5:SetTemplate("Transparent")
	Bar5:SetFrameLevel(ActionBar1:GetFrameLevel())
	Bar5:SetFrameStrata(ActionBar1:GetFrameStrata())
	Bar5:CreateShadow()

	local bar = Bar5
	MultiBarLeft:SetParent(bar)

	for i= 1, Num do
		local b = _G["MultiBarLeftButton"..i]
		local b2 = _G["MultiBarLeftButton"..i-1]
		b:SetSize(Size, Size)
		b:ClearAllPoints()
		b:SetFrameStrata("BACKGROUND")
		b:SetFrameLevel(15)
		
		if i == 1 then
			b:SetPoint("BOTTOMLEFT", bar, Spacing, Spacing)
		elseif i == 5 then
			b:SetPoint("BOTTOMLEFT", bar, Spacing, 34)
		elseif i == 9 then
			b:SetPoint("TOPLEFT", bar, Spacing, -Spacing)
		else
			b:SetPoint("LEFT", b2, "RIGHT", Spacing, 0)
		end
		
		Bar5["Button"..i] = b
	end
end