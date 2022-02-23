local T, C, L = Tukui:unpack()

local ActionBars = T["ActionBars"]

local baseSkinButton = ActionBars.SkinButton
local baseSkinPetAndShiftButton = ActionBars.SkinPetAndShiftButton

function ActionBars:SkinButton(button)
	baseSkinButton(self, button)

	local Name = button:GetName()
	local Button = button
	local Icon = _G[Name.."Icon"]
	local macroText = _G[Name.."Name"]
	local Count = _G[Name.."Count"]
	local HotKey = _G[Name.."HotKey"]
	local PatUI = [=[Interface\AddOns\PatUI\media\fonts\pixelfont.ttf]=]
	
	Count:SetFont(PatUI, 10, "MONOCHROMEOUTLINE")
	HotKey:SetFont(PatUI, 10, "MONOCHROMEOUTLINE")

	HotKey:ClearAllPoints()
	HotKey:SetPoint("TOPRIGHT", 0, 0)

	Button.Backdrop:Kill()

	Button:PatUI(nil, "Single")
	Button.Backdrop:SetBackdropBorderColor(0, 0, 0)

	Button.Backdrop:HookScript("OnEnter", function(self) Button.Backdrop:SetBorderColor(unpack(C["PatUI"]["BorderColor"])) end)
	Button.Backdrop:HookScript("OnLeave", function(self) Button.Backdrop:SetBorderColor(unpack(C["PatUI"]["BorderColor"])) end)
end

function ActionBars:SkinPetAndShiftButton(Normal, Button, Icon, Name, Pet)
	baseSkinPetAndShiftButton(self, Normal, Button, Icon, Name, Pet)

	Button.Backdrop:Kill()

	Button:PatUI(nil, "Single")
	Button.Backdrop:SetBackdropBorderColor(0, 0, 0)
end