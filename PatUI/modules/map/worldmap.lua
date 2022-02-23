local T, C, L = Tukui:unpack()

local WorldMap = T["Maps"]["Worldmap"]
local WorldMapFrame = WorldMapFrame

local baseSkinMap = WorldMap.SkinMap

function WorldMap:SkinMap()
	baseSkinMap(self)
	
	local Frame = WorldMapFrame
	local CloseButton = WorldMapFrameCloseButton
	
	Frame:SetScale(1)
	Frame:PatUI("Transparent", "Single")
	Frame.Backdrop:ClearAllPoints()
	Frame.Backdrop:SetPoint("LEFT", 1, 0)
	Frame.Backdrop:SetPoint("RIGHT", -2, 0)
	Frame.Backdrop:SetPoint("TOP", 0, -66)
	Frame.Backdrop:SetPoint("BOTTOM")
	Frame.Backdrop:CreateThinShadow()
	Frame.Backdrop.Shadow:SetOutside(Frame.Backdrop, 5, 5)
	
	CloseButton:ClearAllPoints()
	CloseButton:SetPoint("TOPRIGHT", 0, 0)
	CloseButton:SkinCloseButton()
end