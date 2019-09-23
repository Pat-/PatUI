local T, C, L = Tukui:unpack()

local GUI = TukuiGUI

--Creating our own section of the Tukui Config
local PatUI = function(self)
	local Window = self:CreateWindow("PatUI")
	
	Window:CreateSection("Enable")
	Window:CreateSwitch("PatUI", "Healer", "A more healer friendly layout")
	Window:CreateSwitch("PatUI", "RepExpMouseOver", "Enable to make Rep/Exp hide")
	Window:CreateSwitch("PatUI", "pInterrupt", "Enables an interrupt announcer (set to /say)")
	Window:CreateSwitch("PatUI", "DisableRight", "Enable to move loot window to left chatframe (use /tukui chat reset)")
	Window:CreateSwitch("PatUI", "ThickBorders", "Enables 3px thick borders")
	--Window:CreateSlider("PatUI", "DataText", "Set number of datatext panels", 1, 6, 1)
end

GUI:AddWidgets(PatUI)
