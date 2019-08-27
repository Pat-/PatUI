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
	
	if C["PatUI"]["SplitBar5"] == true then
		buttonsize = 20.7

		local LeftBar = CreateFrame("Frame", "LeftBar", UIParent, "SecureHandlerStateTemplate")
		LeftBar:Point("LEFT", LeftChatBG, "RIGHT", 4, 0)
		LeftBar:Width((buttonsize * 1) + (Spacing * 2))
		LeftBar:Height((buttonsize * 6) + (Spacing * 7))
		LeftBar:SetFrameStrata("BACKGROUND")
		LeftBar:SetFrameLevel(3)
		LeftBar:SetTemplate("Transparent")
		LeftBar:CreateShadow()

		local RightBar = CreateFrame("Frame", "RightBar", UIParent, "SecureHandlerStateTemplate")
		RightBar:Point("RIGHT", RightChatBG, "LEFT", -4, 0)
		RightBar:Width((buttonsize * 1) + (Spacing * 2))
		RightBar:Height((buttonsize * 6) + (Spacing * 7))
		RightBar:SetFrameStrata("BACKGROUND")
		RightBar:SetFrameLevel(3)
		RightBar:SetTemplate("Transparent")
		RightBar:CreateShadow()

		local bar = LeftBar
		local bar2 = RightBar
		MultiBarLeft:SetParent(bar)

		for i= 1, Num do
			local b = _G["MultiBarLeftButton"..i]
			local b2 = _G["MultiBarLeftButton"..i-1]
			
			b:SetSize(buttonsize, buttonsize)
			b:ClearAllPoints()
			b:SetFrameStrata("BACKGROUND")
			b:SetFrameLevel(15)
			
			if i == 1 then
				b:SetPoint("TOPRIGHT", bar, -Spacing, -Spacing)
			elseif i == 7 then
				b:SetPoint("TOPRIGHT", bar2, -Spacing, -Spacing)
			else
				b:SetPoint("TOP", b2, "BOTTOM", 0, -Spacing)
			end
		end
	else
		local Bar5 = CreateFrame("Frame", "PatBar5", UIParent, "SecureHandlerStateTemplate")
		Bar5:Point("CENTER", ActionBar1, "CENTER", 0, 45)
		Bar5:SetWidth((Size * 12) + (Spacing * 13))
		Bar5:SetHeight((Size * 2) + (Spacing * 3))

		if Bar5:IsShown() then
			PatBar1:SetHeight((Size * 3) + (Spacing * 4))
		end

		Bar5:HookScript("OnHide", function()
			PatBar1:SetHeight((Size * 2) + (Spacing * 3))
		end)

		Bar5:HookScript("OnShow", function()
			PatBar1:SetHeight((Size * 3) + (Spacing * 4))
		end)
			
		local bar = Bar5
		MultiBarLeft:SetParent(bar)

		-- setup the bar
		for i=1, Num do
			local b = _G["MultiBarLeftButton"..i]
			local b2 = _G["MultiBarLeftButton"..i-1]
			b:SetSize(Size, Size)
			b:ClearAllPoints()
			b:SetFrameStrata("BACKGROUND")
			b:SetFrameLevel(15)
			
			if i == 1 then
				b:SetPoint("TOPLEFT", bar, Spacing, -Spacing)
			else
				b:SetPoint("LEFT", b2, "RIGHT", Spacing, 0)
			end
		end
	end
end