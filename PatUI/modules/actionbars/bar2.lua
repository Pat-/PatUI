local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local ActionBars =  T["ActionBars"]
local Num = NUM_ACTIONBAR_BUTTONS


local baseCreateBar2 = ActionBars.CreateBar2

function ActionBars:CreateBar2()
    -- Call the base function first
    baseCreateBar2(self)
	
	--- Then my stuff
	local Size = C["ActionBars"]["NormalButtonSize"]
	local Spacing = C["ActionBars"]["ButtonSpacing"]
	local ActionBar1 = Panels.ActionBar1
	local ActionBar2 = Panels.ActionBar2

	ActionBar2.Backdrop:Kill()
	ActionBar2.Backdrop.Shadow:Kill()

	local Bar2 = CreateFrame("Frame", "PatBar2", UIParent, "SecureHandlerStateTemplate")
	Bar2:Point("CENTER", ActionBar1, "CENTER", 0, 15)
	Bar2:SetWidth((Size * 12) + (Spacing * 13))
	Bar2:SetHeight((Size * 2) + (Spacing * 3))

	if Bar2:IsShown() then
		PatBar1:SetHeight((Size * 2) + (Spacing * 3))
	end

	Bar2:HookScript("OnHide", function()
		PatBar1:SetHeight((Size * 1) + (Spacing * 2))
	end)

	Bar2:HookScript("OnShow", function()
		PatBar1:SetHeight((Size * 2) + (Spacing * 3))
	end)
		
	local bar = Bar2
	MultiBarBottomLeft:SetParent(bar)

	-- setup the bar
	for i=1, Num do
		local b = _G["MultiBarBottomLeftButton"..i]
		local b2 = _G["MultiBarBottomLeftButton"..i-1]
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


local VehicleIndicator = T.Miscellaneous.VehicleIndicator

function VehicleIndicator:Enable()
	local Indicator = VehicleSeatIndicator

	Indicator:ClearAllPoints()
	Indicator:SetParent(UIParent)

	-- This will block UIParent_ManageFramePositions() to be executed
	Indicator.IsShown = function() return false end
end