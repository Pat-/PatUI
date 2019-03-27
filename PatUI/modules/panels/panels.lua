local T, C, L = Tukui:unpack()

local Panels = T.Panels

local function Enable()
	local DataTextLeft = Panels.DataTextLeft
	local DataTextRight = Panels.DataTextRight
	local TabsBGRight = Panels.TabsBGRight
	local TabsBGLeft = Panels.TabsBGLeft
	local LeftChatBG = Panels.LeftChatBG
	local RightChatBG = Panels.RightChatBG
	
	DataTextLeft:SetBackdrop(nil)
	DataTextLeft:ClearAllPoints()
	DataTextLeft:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 152)
	DataTextLeft:SetFrameStrata("HIGH")
	
	DataTextRight:SetBackdrop(nil)
	DataTextRight:ClearAllPoints()
	DataTextRight:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -10, 152)
	
	LeftChatBG:SetParent(UIParent)
	LeftChatBG:ClearAllPoints()
	LeftChatBG:SetFrameStrata("BACKGROUND")
	LeftChatBG:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 4, 4)
	
	RightChatBG:SetParent(UIParent)
	RightChatBG:ClearAllPoints()
	RightChatBG:SetFrameStrata("BACKGROUND")
	RightChatBG:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 4)
end
hooksecurefunc(Panels, "Enable", Enable)

------------------------------------------------------------------------
-- Creating DataPoints
------------------------------------------------------------------------

local DataPoint = {}

for i=1, 6 do	
	DataPoint[i] = CreateFrame("Frame", "DataPoint"..i, UIParent)
	DataPoint[i]:Width(120)
	DataPoint[i]:Height(18)
	DataPoint[i]:SetTemplate("Transparent")
	DataPoint[i]:SetFrameStrata("BACKGROUND")
	DataPoint[i]:CreateShadow()
	
	if(i == 1) then
		DataPoint[i]:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 4, -4)
	else
		DataPoint[i]:Point("TOP", "DataPoint"..i - 1, "BOTTOM", 0, -3)
	end
end
