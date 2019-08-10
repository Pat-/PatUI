local T, C, L = Tukui:unpack()

local GUI = TukuiGUI

--Creating our own section of the Tukui Config
local PatUI = function(self)
	local Window = self:CreateWindow("PatUI")
	
	Window:CreateSection("Enable")
	Window:CreateSwitch("PatUI", "SmallerChat", "Makes chatfames shorter")
	Window:CreateSwitch("PatUI", "Healer", "A more healer friendly layout")
	Window:CreateSwitch("PatUI", "ShowSolo", "Shows Raid/Party frame while solo")
	Window:CreateSwitch("PatUI", "CombatHide", "Hides tooltip when in combat")
	Window:CreateSwitch("PatUI", "RepExpMouseOver", "Enable to make Rep/Exp hide")
end

GUI:AddWidgets(PatUI)