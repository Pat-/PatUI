local P, C, L = unpack(Tukui)
if C["chat"].enable ~= true then return end

local function Skin(frame)
	local chat = frame:GetName()
	local tab = _G[chat.."Tab"]
	
	-- recolor the tab
	_G[chat.."TabText"]:SetTextColor(unpack(C.media.datatextcolor2))
	_G[chat.."TabText"]:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
	_G[chat.."TabText"].SetTextColor = P.dummy
	
	frame.isPatSkinned = true
end

TukuiChat:HookScript("OnEvent", function(self, event, addon)
	if addon == "Blizzard_CombatLog" then
		for i = 1, NUM_CHAT_WINDOWS do
			local frame = _G[format("ChatFrame%s", i)]
			Skin(frame)
		end
	end
end)

local function SkinTempChat()
	local frame = FCF_GetCurrentChatFrame()

	-- do a check if we already did a skinning earlier for this temp chat frame
	if frame.isPatSkinned then return end

	SkinAndPosition(frame)
end

hooksecurefunc("FCF_OpenTemporaryWindow", SkinTempChat)

-- default position of chat
P.SetDefaultChatPosition = function(frame)
	if frame then
		local id = frame:GetID()
		local name = FCF_GetChatWindowInfo(id)
		
		if id == 1 then
			frame:Size(P.InfoLeftRightWidth, 166)
		elseif id == 4 then
			frame:ClearAllPoints()
			frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -500, -500)
		end
		
		-- lock them if unlocked
		if not frame.isLocked then FCF_SetLocked(frame, 1) end
	end
end
hooksecurefunc("FCF_RestorePositionAndDimensions", P.SetDefaultChatPosition)
