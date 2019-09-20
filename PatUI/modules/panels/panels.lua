local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local Experience = T["Miscellaneous"]["Experience"]
local Reputation = T["Miscellaneous"]["Reputation"]
local Minimap = T["Maps"]["Minimap"]

local baseEnable = Panels.Enable
local baseExp = Experience.Create
local baseRep = Reputation.Create

function Panels:Enable()
	-- First call the base function
	baseEnable(self)
	
	-- then my stuff
	local DataTextLeft = Panels.DataTextLeft
	local DataTextRight = Panels.DataTextRight
	local TabsBGRight = Panels.TabsBGRight
	local TabsBGLeft = Panels.TabsBGLeft
	local LeftChatBG = Panels.LeftChatBG
	local RightChatBG = Panels.RightChatBG
	
	LeftChatBG:SetParent(UIParent)
	LeftChatBG:ClearAllPoints()
	LeftChatBG:SetFrameStrata("BACKGROUND")
	LeftChatBG:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 4, 4)
	LeftChatBG:SetHeight(C.Chat.LeftHeight + 38)
	LeftChatBG.Backdrop.Shadow:Kill()
	LeftChatBG:CreateShadow()
	if C["PatUI"]["ThickBorders"] == true then
		LeftChatBG:PatUI("Transparent")
	end
	
	if C["PatUI"]["DisableRight"] == true then
		RightChatBG:ClearAllPoints()
		TabsBGRight:ClearAllPoints()
	else
		RightChatBG:SetParent(UIParent)
		RightChatBG:ClearAllPoints()
		RightChatBG:SetFrameStrata("BACKGROUND")
		RightChatBG:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 4)
		RightChatBG:SetHeight(C.Chat.RightHeight + 38)
		RightChatBG.Backdrop.Shadow:Kill()
		RightChatBG:CreateShadow()
		if C["PatUI"]["ThickBorders"] == true then
			RightChatBG:PatUI("Transparent")
		end
	end
	
	DataTextLeft:SetBackdrop(nil)
	DataTextLeft:SetBorderColor(0, 0, 0, 0)
	DataTextLeft:ClearAllPoints()
	DataTextLeft:SetFrameStrata("HIGH")
	DataTextLeft:Point("CENTER", TabsBGLeft, "CENTER", 0, 0)
	DataTextLeft:Height(23)
	
	DataTextRight:SetBackdrop(nil)
	DataTextRight:ClearAllPoints()	
	DataTextRight:Point("CENTER", TabsBGRight, "CENTER", 0, 0)
	DataTextRight:Height(23)
	
	LeftChatBG:SetBackdropColor(0.1, 0.1, 0.1, 0.4)
	RightChatBG:SetBackdropColor(0.1, 0.1, 0.1, 0.4)
	
	
	if C["PatUI"]["ThickBorders"] == true then
		local LeftTab = CreateFrame("Frame", nil, LeftChatBG)
		LeftTab:Size(370, 23)
		LeftTab:SetFrameLevel(DataTextLeft:GetFrameLevel() + 1)
		LeftTab:PatUI("Transparent")
		LeftTab:Point("CENTER", LeftChatBG, "CENTER", 0, 59)
	
		local RightTab = CreateFrame("Frame", nil, RightChatBG)
		RightTab:Size(370, 23)
		RightTab:SetFrameLevel(DataTextRight:GetFrameLevel() + 1)
		RightTab:PatUI("Transparent")
		RightTab:Point("CENTER", RightChatBG, "CENTER", 0, 59)
	
		TabsBGLeft:SetBackdropColor(0, 0, 0, 0)
		TabsBGRight:SetBackdropColor(0, 0, 0, 0)
	else
		TabsBGLeft:SetBackdropColor(0.1, 0.1, 0.1, 0.4)
		TabsBGRight:SetBackdropColor(0.1, 0.1, 0.1, 0.4)
	end
end

function Experience:Create()
	-- First call the base function
	baseExp(self)
	
	-- then my stuff
	local XPBar = self.XPBar1
	local XPBar2 = self.XPBar2
	local RightChatBG = Panels.RightChatBG
	
	XPBar.Backdrop.Shadow:Kill()
	XPBar2.Backdrop.Shadow:Kill()
	XPBar2:ClearAllPoints()
	
	XPBar:ClearAllPoints()
	
	if C["PatUI"]["ThickBorders"] == true then
		local XPBG = CreateFrame("Frame", nil, XPBar)
		XPBG:PatUI()
		XPBG:SetFrameLevel(XPBar:GetFrameLevel() - 1)
		XPBG:Size(XPBar:GetWidth(), 9)
		XPBG:Point("CENTER", XPBar, "CENTER", 0, 0)
		XPBG:CreateShadow()
	else
		XPBar:CreateShadow()
	end
	
	if C["PatUI"]["DisableRight"] == true then
		XPBar:Point("TOPLEFT", Minimap, "BOTTOMLEFT", 0, 4)
		XPBar:Height(5)
		XPBar:Width(196)
	else
		XPBar:Point("BOTTOMLEFT", RightChatBG, "TOPLEFT", 2, 5)
		XPBar:Height(5)
		XPBar:Width(RightChatBG:GetWidth() - 4)
	end
	
	-- Lets declutter the screen a little and make Exp/Rep Bars hide when not moused over
	if C["PatUI"]["RepExpMouseOver"] == true then
		XPBar:SetAlpha(0)
		XPBar:HookScript("OnEnter", function(self) self:SetAlpha(1) end)
		XPBar:HookScript("OnLeave", function(self) self:SetAlpha(0) end)
	end
end

function Reputation:Create()
	-- First we call the base function
	baseRep(self)
	
	-- then my stuff
	local RepBar1 = self.RepBar1
	
	RepBar1:CreateShadow()
	
	if C["PatUI"]["RepExpMouseOver"] == true then
		RepBar1:SetAlpha(0)
		RepBar1:HookScript("OnEnter", function(self) self:SetAlpha(1) end)
		RepBar1:HookScript("OnLeave", function(self) self:SetAlpha(0) end)
	end
end

------------------------------------------------------------------------
-- Creating DataPoints
------------------------------------------------------------------------

local DataPoint = {}

for i=1, 6 do	
	DataPoint[i] = CreateFrame("Frame", "DataPoint"..i, UIParent)
	DataPoint[i]:Width(120)
	DataPoint[i]:Height(18)
	if C["PatUI"]["ThickBorders"] == true then
		DataPoint[i]:PatUI("Transparent")
	else
		DataPoint[i]:SetTemplate("Transparent")
	end
	DataPoint[i]:SetFrameStrata("BACKGROUND")
	DataPoint[i]:CreateShadow()
	
	
	if(i == 1) then
		DataPoint[i]:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 4, -4)
	else
		DataPoint[i]:Point("TOP", "DataPoint"..i - 1, "BOTTOM", 0, -3)
	end
end
