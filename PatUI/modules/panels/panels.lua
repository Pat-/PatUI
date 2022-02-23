local T, C, L = Tukui:unpack()

local Chat = T["Chat"]

local baseEnable = Chat.AddPanels

function Chat:AddPanels()
	-- First call the base function
	baseEnable(self)
	
	-- then my stuff
	local LeftChatBG = TukuiChatLeftBackground
	local RightChatBG = TukuiChatRightBackground
	local TabsRight = T.Chat.Panels and T.Chat.Panels.RightChatTabs
	local TabsLeft = T.Chat.Panels and T.Chat.Panels.LeftChatTabs
	
	LeftChatBG:SetParent(UIParent)
	LeftChatBG:ClearAllPoints()
	LeftChatBG:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 22, 33)
	LeftChatBG:SetFrameStrata("BACKGROUND")
	LeftChatBG:SetFrameLevel(5)
	LeftChatBG:SetWidth(LeftChatBG:GetWidth() - 12)

	LeftChatBG.Backdrop:Kill()

	LeftChatBG:PatUI("Transparent")
	LeftChatBG.Backdrop:SetBackdropBorderColor(0, 0, 0)
	LeftChatBG.Backdrop:SetFrameStrata("BACKGROUND")
	
	RightChatBG:SetParent(UIParent)
	RightChatBG:ClearAllPoints()
	RightChatBG:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -22, 33)
	RightChatBG:SetFrameStrata("BACKGROUND")
	RightChatBG:SetFrameLevel(5)
	RightChatBG:SetWidth(RightChatBG:GetWidth() - 12)

	RightChatBG.Backdrop:Kill()

	RightChatBG:PatUI("Transparent")
	RightChatBG.Backdrop:SetBackdropBorderColor(0, 0, 0)
	RightChatBG.Backdrop:SetFrameStrata("BACKGROUND")

	TabsLeft:ClearAllPoints()
	TabsLeft:SetPoint("BOTTOM", LeftChatBG, "TOP", 0, 2)
	TabsLeft:SetSize(LeftChatBG:GetWidth(), 22)
	TabsLeft:PatUI()

	TabsLeft:SetFrameLevel(5)
	TabsLeft.Backdrop:SetFrameStrata("BACKGROUND")

	TabsRight:ClearAllPoints()
	TabsRight:SetPoint("BOTTOM", RightChatBG, "TOP", 0, 2)
	TabsRight:SetSize(RightChatBG:GetWidth(), 22)
	TabsRight:PatUI()

	TabsRight:SetFrameLevel(5)
	TabsRight.Backdrop:SetFrameStrata("BACKGROUND")

	local LeftShadowFrame = CreateFrame("Frame", nil, LeftChatBG)
	LeftShadowFrame:SetPoint("TOPLEFT", TabsLeft, -3, 3)
	LeftShadowFrame:SetPoint("BOTTOMRIGHT", TukuiLeftDataTextBox, 3, -3)
	LeftShadowFrame:CreateShadow()

	local RightShadowFrame = CreateFrame("Frame", nil, RightChatBG)
	RightShadowFrame:SetPoint("TOPLEFT", TabsRight, -3, 3)
	RightShadowFrame:SetPoint("BOTTOMRIGHT", TukuiRightDataTextBox, 3, -3)
	RightShadowFrame:CreateShadow()
end
