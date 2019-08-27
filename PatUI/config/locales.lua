local T, C, L = Tukui:unpack()

local GUI = TukuiGUI

--Creating our own section of the Tukui Config
local PatUI = function(self)
	local Window = self:CreateWindow("PatUI")
	
	Window:CreateSection("Enable")
	Window:CreateSwitch("PatUI", "Healer", "A more healer friendly layout")
	Window:CreateSwitch("PatUI", "RepExpMouseOver", "Enable to make Rep/Exp hide")
	Window:CreateSwitch("PatUI", "SplitBar5", "Toggle Bar5 to be split or not")
	Window:CreateSwitch("PatUI", "HideRight", "Hide Right Chatframe and move loot window")
end

GUI:AddWidgets(PatUI)