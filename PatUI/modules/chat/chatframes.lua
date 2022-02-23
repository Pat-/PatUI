local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local Chat = T["Chat"]
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local baseStyleFrame = Chat.StyleFrame
local baseReset = Chat.Reset

function Chat:SetTabWidth()
	for i=1, NUM_CHAT_WINDOWS do
		local tab = _G[format("ChatFrame%sTab", i)]
		PanelTemplates_TabResize(tab, tab.isTemporary and 20 or 10, nil, nil, nil, tab.textWidth);
	end
end

function Chat:StyleFrame(frame)
	baseStyleFrame(self, frame)

	local Frame = frame
	local FrameName = frame:GetName()
	local EditBox = _G[FrameName.."EditBox"]
	local TabsLeft = T.Chat.Panels and T.Chat.Panels.LeftChatTabs

	EditBox:ClearAllPoints()
	EditBox:SetInside(TabsLeft)

	EditBox.Backdrop:ClearAllPoints()
	EditBox.Backdrop:SetAllPoints(TabsLeft)
end

function Chat:SetChatFramePosition()
	for i = 1, NUM_CHAT_WINDOWS do
		local Frame = _G["ChatFrame"..i]
		local ID = Frame:GetID()
		local tab = _G[format("ChatFrame%sTab", i)]
		local tabtext = _G["ChatFrame"..i.."TabText"]
		
		tabtext:ClearAllPoints()
		tabtext:SetPoint("CENTER", tab, "CENTER", 0, -2)

	local Settings = TukuiDatabase.Variables[T.MyRealm][T.MyName].Chat.Positions["Frame" .. ID]

	if Settings then
		local Anchor1, Anchor2, X, Y, Width, Height = unpack(Settings)
		
		if ID == 1 or ID == 2 or ID == 3 then
			Frame:SetParent(TukuiChatLeftBackground)
		end

		-- Set default chat frame position
		if (ID == 1) then
			Frame:SetUserPlaced(true)
			Frame:ClearAllPoints()
			Frame:SetSize(C.Chat.LeftWidth - 6, C.Chat.LeftHeight - 8)
			Frame:SetPoint("CENTER", TukuiChatLeftBackground, "CENTER", 2, 0)
		elseif (ID == 4) then
			Frame:SetParent(TukuiChatLeftBackground)
			Frame:SetUserPlaced(true)
			Frame:ClearAllPoints()
			Frame:SetSize(C.Chat.RightWidth - 6, C.Chat.RightHeight - 8)
			Frame:SetPoint("CENTER", TukuiChatRightBackground, "CENTER", -2, 0)
			Frame:SetJustifyH("RIGHT")
		end
	end		
		if (not Frame.isLocked) then
			FCF_SetLocked(Frame, 1)
		end
	end
end

function Chat:UpdateTabColors()
	for i = 1, NUM_CHAT_WINDOWS do
		local tabtext = _G["ChatFrame"..i.."TabText"]

   		tabtext:SetTextColor(class.r, class.g, class.b)
   	end
end
hooksecurefunc("FCFTab_UpdateColors", Chat.UpdateTabColors)


-- Using effectively the same as what Tukz has but making sure the 2 extra chat frames he added aren't created
function Chat:Reset()
	baseReset(self)

	local IsPublicChannelFound = EnumerateServerChannels()
	
	if not IsPublicChannelFound then
		-- Restart this function until we are able to query public channels
		C_Timer.After(1, Chat.Reset)
		
		return
	end

	-- Create our custom chatframes
	FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)
	FCF_SetLocked(ChatFrame3, 1)
	FCF_DockFrame(ChatFrame3)

	FCF_OpenNewWindow(LOOT)
	FCF_UnDockFrame(ChatFrame4)

	FCF_SetChatWindowFontSize(nil, ChatFrame1, 12)
	FCF_SetChatWindowFontSize(nil, ChatFrame2, 12)
	FCF_SetChatWindowFontSize(nil, ChatFrame3, 12)
	FCF_SetChatWindowFontSize(nil, ChatFrame4, 12)
	FCF_SetChatWindowFontSize(nil, ChatFrame5, 12)
	FCF_SetWindowName(ChatFrame1, "G, S & W")
	FCF_SetWindowName(ChatFrame2, "Log")
	FCF_SetWindowName(ChatFrame3, "General")
	FCF_SetWindowName(ChatFrame4, "Loot")

	DEFAULT_CHAT_FRAME:SetUserPlaced(true)

	local ChatGroup = {}
	local Channels = {}
	
	for i=1, select("#", EnumerateServerChannels()), 1 do
		Channels[i] = select(i, EnumerateServerChannels())
	end

	-- Remove everything in first 4 chat windows
	for i = 1, 6 do
		if (T.Retail and i ~= 2 and i ~= 3) or (T.BCC and i ~= 2) then
			local ChatFrame = _G["ChatFrame"..i]

			ChatFrame_RemoveAllMessageGroups(ChatFrame)
			ChatFrame_RemoveAllChannels(ChatFrame)
		end
	end

	-----------------------
	-- ChatFrame 1 Setup --
	-----------------------
	
	ChatGroup = {"SAY", "EMOTE", "YELL", "GUILD","OFFICER", "GUILD_ACHIEVEMENT", "WHISPER", "PARTY", "PARTY_LEADER", "RAID", "RAID_LEADER", "RAID_WARNING", "INSTANCE_CHAT", "INSTANCE_CHAT_LEADER", "BG_HORDE", "BG_ALLIANCE", "BG_NEUTRAL", "AFK", "DND", "ACHIEVEMENT", "BN_WHISPER", "BN_CONVERSATION"}
	
	for _, v in ipairs(ChatGroup) do
		ChatFrame_AddMessageGroup(_G.ChatFrame1, v)
	end
	
	FCF_SelectDockFrame(ChatFrame1)

	-----------------------
	-- ChatFrame 3 Setup --
	-----------------------
	
	if T.BCC then
		for i = 1, #Channels do
			ChatFrame_RemoveChannel(ChatFrame1, Channels[i])
			ChatFrame_AddChannel(ChatFrame3, Channels[i])
		end

		-- Adjust Chat Colors
		ChangeChatColor("CHANNEL1", 195/255, 230/255, 232/255)
		ChangeChatColor("CHANNEL2", 232/255, 158/255, 121/255)
		ChangeChatColor("CHANNEL3", 232/255, 228/255, 121/255)
		ChangeChatColor("CHANNEL4", 232/255, 228/255, 121/255)
		ChangeChatColor("CHANNEL5", 0/255, 228/255, 121/255)
		ChangeChatColor("CHANNEL6", 0/255, 228/255, 0/255)
	end

	-----------------------
	-- ChatFrame 4 Setup --
	-----------------------
	
	local Tab4 = ChatFrame4Tab
	local Chat4 = ChatFrame4

	ChatGroup = {"COMBAT_XP_GAIN", "COMBAT_HONOR_GAIN", "COMBAT_FACTION_CHANGE", "LOOT","MONEY", "SYSTEM", "ERRORS", "IGNORED", "SKILL", "CURRENCY"}
	
	for _, v in ipairs(ChatGroup) do
		ChatFrame_AddMessageGroup(_G.ChatFrame4, v)
	end

	Tab4:ClearAllPoints()
	
	FCF_RestorePositionAndDimensions(Chat4)
	FCF_SetTabPosition(Chat4, 0)
end