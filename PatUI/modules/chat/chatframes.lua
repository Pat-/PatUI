local T, C, L = Tukui:unpack()

local Panels = T.Panels
local Chat = T.Chat

--[[ default position of chat
T.SetDefaultChatPosition = function(frame)
	if frame then
		local id = frame:GetID()
		local name = FCF_GetChatWindowInfo(id)
		local LeftChatBG = Panels.LeftChatBG
		local RightChatBG = Panels.RightChatBG
		
		if id == 1 then
			frame:ClearAllPoints()
			frame:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 20, 20)
			--frame:SetParent(LeftChatBG)
		elseif id == 4 and name == LOOT then
			if not frame.isDocked then
				frame:ClearAllPoints()
				frame:Point("TOPLEFT", RightChatBG, "TOPLEFT", 3, 2)
				frame:Point("BOTTOMRIGHT", RightChatBG, "BOTTOMRIGHT", -5, 0)
				--frame:SetParent(RightChatBG)
				frame:SetJustifyH("LEFT")
			end
		end
		
		-- lock them if unlocked
		if not frame.isLocked then FCF_SetLocked(frame, 1) end
	end
end
hooksecurefunc("FCF_RestorePositionAndDimensions", T.SetDefaultChatPosition)]]--

function Chat:SetDefaultChatFramesPositions()

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
		TukuiData[GetRealmName()][UnitName("Player")].Chat["Frame" .. i] = {Anchor1, Anchor2, X, Y, Width, 139}
	end
end

function Chat:Install()
	-- Create our custom chatframes
	FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)
	FCF_OpenNewWindow(GENERAL)
	FCF_SetLocked(ChatFrame3, 1)
	FCF_DockFrame(ChatFrame3)
	FCF_OpenNewWindow(LOOT)
	FCF_UnDockFrame(ChatFrame4)
	--ChatFrame4:Show()

	-- Set more chat groups
	ChatFrame_RemoveAllMessageGroups(ChatFrame1)
	ChatFrame_RemoveChannel(ChatFrame1, TRADE)
	ChatFrame_RemoveChannel(ChatFrame1, GENERAL)
	ChatFrame_RemoveChannel(ChatFrame1, L.ChatFrames.LocalDefense)
	ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
	ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame1, "DND")
	ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")

	-- Move ChatFrame1 Globals Channels to ChatFrame3
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)

	-- ChatFrame 3
	ChatFrame_AddChannel(ChatFrame3, "General")
	ChatFrame_AddChannel(ChatFrame3, "Trade")
	ChatFrame_AddChannel(ChatFrame3, "LocalDefense")

	-- Setup the right chat
	ChatFrame_RemoveAllMessageGroups(ChatFrame4)
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame4, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame4, "MONEY")
	ChatFrame_AddMessageGroup(ChatFrame4, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame4, "ERRORS")
	ChatFrame_AddMessageGroup(ChatFrame4, "IGNORED")

	-- Enable Classcolor
	ToggleChatColorNamesByClassGroup(true, "SAY")
	ToggleChatColorNamesByClassGroup(true, "EMOTE")
	ToggleChatColorNamesByClassGroup(true, "YELL")
	ToggleChatColorNamesByClassGroup(true, "GUILD")
	ToggleChatColorNamesByClassGroup(true, "OFFICER")
	ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "WHISPER")
	ToggleChatColorNamesByClassGroup(true, "PARTY")
	ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID")
	ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND_LEADER")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")

	DEFAULT_CHAT_FRAME:SetUserPlaced(true)

	self:SetDefaultChatFramesPositions()
end