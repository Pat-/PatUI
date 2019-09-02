local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local Chat = T["Chat"]

Chat.RightChatName = LOOT

local baseSetDefaultChatFramesPositions = Chat.SetDefaultChatFramesPositions
local baseInstall = Chat.Install
local baseSetChatFramePosition = Chat.SetChatFramePosition

function Chat:SetChatFramePosition()
	if (not TukuiData[GetRealmName()][UnitName("Player")].Chat) then
		return
	end
	
	local Frame = self
	local ID = Frame:GetID()
	
	local Settings = TukuiData[GetRealmName()][UnitName("Player")].Chat["Frame" .. ID]

	if Settings then
		local Anchor1, Anchor2, X, Y, Width, Height = unpack(Settings)
		
		if ID == 1 then
			Frame:SetParent(UIParent)
			Frame:SetUserPlaced(true)
			Frame:ClearAllPoints()
			Frame:SetSize(C.Chat.LeftWidth, C.Chat.LeftHeight + 1)
			Frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 14 , 11)
		elseif ID == 4 then
			Frame:SetParent(UIParent)
			Frame:SetUserPlaced(true)
			Frame:ClearAllPoints()
			Frame:SetSize(C.Chat.RightWidth, C.Chat.RightHeight + 1)
			Frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -14, 11)
			Frame:SetJustifyH("LEFT")
		end
	end
end

function Chat:SetDefaultChatFramesPositions()
	
	baseSetDefaultChatFramesPositions(self)

	if (not TukuiData[GetRealmName()][UnitName("Player")].Chat) then
		TukuiData[GetRealmName()][UnitName("Player")].Chat = {}
	end

	for i = 1, NUM_CHAT_WINDOWS do
		local Frame = _G["ChatFrame"..i]
		local ID = Frame:GetID()
		local Height = 150
		local Width = 370
		
		-- Set font size and chat frame size
		Frame:Size(Width, Height)

		-- Set default chat frame position
		if (ID == 1) then
			Frame:ClearAllPoints()
			Frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 14 , 11)
		elseif (ID == 4) then
			if (not Frame.isDocked) then
				Frame:ClearAllPoints()
				Frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -14, 11)
			end
		end
		
		if (ID == 1) then
			FCF_SetWindowName(Frame, "G, S & W")
		end

		if (ID == 2) then
			FCF_SetWindowName(Frame, "Log")
		end
		
		if (not Frame.isLocked) then
			FCF_SetLocked(Frame, 1)
		end

		local Anchor1, Parent, Anchor2, X, Y = Frame:GetPoint()
		TukuiData[GetRealmName()][UnitName("Player")].Chat["Frame" .. i] = {Anchor1, Anchor2, X, Y, Width, 113}
	end
end

function Chat:Install()
	
	baseInstall(self)
	-- Create our custom chatframes
	ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)
	FCF_OpenNewWindow(GENERAL)
	FCF_SetLocked(ChatFrame3, 1)
	FCF_DockFrame(ChatFrame3)
	FCF_OpenNewWindow(self.RightChatName)
	FCF_UnDockFrame(ChatFrame4)
	
	local Transfers = {
		"COMBAT_XP_GAIN",
		"COMBAT_HONOR_GAIN",
		"COMBAT_FACTION_CHANGE",
		"LOOT",
		"MONEY",
		"SYSTEM",
		"ERRORS",
		"IGNORED",
		"SKILL",
		"CURRENCY", 
	}
	-- ChatFrame1, need to do it this way, else it crash on WoW Classic
	for index, value in pairs(Transfers) do
		if ChatTypeGroup[value] then
			for eventIndex, eventValue in pairs(ChatTypeGroup[value]) do

				if Transfers[eventValue] then
					ChatFrame1:UnregisterEvent(eventValue)
				end
			end

			RemoveChatWindowMessages(1, value)
			ChatFrame1.messageTypeList[value] = nil
		end
	end

	ChatFrame_RemoveChannel(ChatFrame1, "General")
	ChatFrame_RemoveChannel(ChatFrame1, "Trade")
	ChatFrame_RemoveChannel(ChatFrame1, "LocalDefense")

	-- ChatFrame 3
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_AddChannel(ChatFrame3, "General")
	ChatFrame_AddChannel(ChatFrame3, "Trade")
	ChatFrame_AddChannel(ChatFrame3, "LocalDefense")

	-- ChatFrame 4 [right chat]
	ChatFrame_RemoveAllMessageGroups(ChatFrame4)
	for index, value in pairs(Transfers) do
		ChatFrame_AddMessageGroup(ChatFrame4, value)
	end

	-- Enable Classcolor
	ToggleChatColorNamesByClassGroup(true, "SAY")

	DEFAULT_CHAT_FRAME:SetUserPlaced(true)
end