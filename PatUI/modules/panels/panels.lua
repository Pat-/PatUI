local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local Experience = T["Miscellaneous"]["Experience"]
local Minimap = T["Maps"]["Minimap"]

local function Enable()
	local DataTextLeft = Panels.DataTextLeft
	local DataTextRight = Panels.DataTextRight
	local TabsBGRight = Panels.TabsBGRight
	local TabsBGLeft = Panels.TabsBGLeft
	local LeftChatBG = Panels.LeftChatBG
	local RightChatBG = Panels.RightChatBG
	
	LeftChatBG.Backdrop.Shadow:Kill()
	RightChatBG.Backdrop.Shadow:Kill()
	
	DataTextLeft:SetBackdrop(nil)
	DataTextLeft:ClearAllPoints()
	DataTextLeft:SetFrameStrata("HIGH")
	
	DataTextRight:SetBackdrop(nil)
	DataTextRight:ClearAllPoints()	
	
	LeftChatBG:SetParent(UIParent)
	LeftChatBG:ClearAllPoints()
	LeftChatBG:SetFrameStrata("BACKGROUND")
	LeftChatBG:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 4, 4)
	LeftChatBG:CreateShadow()
	
	RightChatBG:SetParent(UIParent)
	RightChatBG:ClearAllPoints()
	RightChatBG:SetFrameStrata("BACKGROUND")
	RightChatBG:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 4)
	RightChatBG:CreateShadow()
	
	if C["General"]["SmallerChat"] == true then
		LeftChatBG:SetHeight(151.5)
		RightChatBG:SetHeight(151.5)
		DataTextLeft:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 126)
		DataTextRight:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -10, 126)
		DataTextLeft:Height(24)
		DataTextRight:Height(24)
	else
		DataTextLeft:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 152)
		DataTextRight:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -10, 152)
	end
end
hooksecurefunc(Panels, "Enable", Enable)

local function Create(self)
	local LeftChatBG = Panels.LeftChatBG
	local RightChatBG = Panels.RightChatBG
	local XPBar = self.XPBar1
	local AzeriteBar = self.XPBar2
	
	XPBar.Backdrop.Shadow:Kill()
	AzeriteBar.Backdrop.Shadow:Kill()
	
	XPBar:ClearAllPoints()
	XPBar:Point("TOPLEFT", Minimap, "BOTTOMLEFT", 0, -3)
	XPBar:Height(5)
	XPBar:Width(Minimap:GetWidth())
	XPBar:CreateShadow()
	
	AzeriteBar:ClearAllPoints()
	AzeriteBar:Point("TOPLEFT", Minimap, "BOTTOMLEFT", 0, -11)
	AzeriteBar:Height(5)
	AzeriteBar:Width(Minimap:GetWidth())
	AzeriteBar:CreateShadow()
	AzeriteBar:SetReverseFill(false)
end
hooksecurefunc(Experience, "Create", Create)

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
