local P, C, L, G = unpack(Tukui)

-- for skinning tabs, buttons and crap that don't require a LoD AddOn from Blizzard

for i=1, 4 do
	_G["CharacterFrameTab"..i].backdrop:PatSkin()
	_G["SpellBookFrameTabButton"..i].backdrop:PatSkin()
	_G["FriendsFrameTab"..i].backdrop:PatSkin()
	_G["PVPFrameTab"..i].backdrop:PatSkin()
end

for i=1, 3 do
	_G["FriendsTabHeaderTab"..i].backdrop:PatSkin()
end

for i=1, 2 do
	_G["PVEFrameTab"..i].backdrop:PatSkin()
	_G["PetJournalParentTab"..i].backdrop:PatSkin()
	_G["MailFrameTab"..i].backdrop:PatSkin()
end

local frames = {
	TakeAll_Button,
	TakeCash_Button,
	SendMailMailButton,
	SendMailCancelButton,
	SendMailMoneyGold.backdrop,
	SendMailMoneySilver.backdrop,
	SendMailMoneyCopper.backdrop,
	SendMailSubjectEditBox.backdrop,
	SendMailNameEditBox.backdrop,
	SendMailScrollFrame,
	WorldMapLevelDropDown.backdrop,
	WorldMapZoneMinimapDropDown.backdrop,
	WorldMapContinentDropDown.backdrop,
	WorldMapZoneDropDown.backdrop,
	WorldMapZoomOutButton,
	WorldMapDetailFrame.backdrop,
	WorldMapTrackQuest.backdrop,
	WorldMapQuestShowObjectives.backdrop,
	WorldMapShowDigSites.backdrop,
}

for _,f in pairs(frames) do
	f:PatSkin()
end

WorldMapDetailFrame.backdrop:Point("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", 0, 0)
WorldMapDetailFrame.backdrop:Point("BOTTOMRIGHT", WorldMapDetailFrame, "BOTTOMRIGHT", 0, 0)

local function QuestSkin()
	WorldMapQuestDetailScrollFrame.backdrop:PatSkin()
	WorldMapQuestRewardScrollFrame.backdrop:PatSkin()
	WorldMapQuestScrollFrame.backdrop:PatSkin()
end
hooksecurefunc("WorldMapFrame_SetQuestMapView", QuestSkin)

for i = 1, INBOXITEMS_TO_DISPLAY do
	local bg = _G["MailItem"..i]
	local b = _G["MailItem"..i.."Button"]
	local t = _G["MailItem"..i.."ButtonIcon"]
	
	
	bg.backdrop:PatSkin()
	b:PatSkin()
	t:Point("TOPLEFT", 0, 0)
	t:Point("BOTTOMRIGHT", 0, 0)
end

local function MailFrameSkin()
	for i = 1, ATTACHMENTS_MAX_SEND do				
		local b = _G["SendMailAttachment"..i]
		local t = b:GetNormalTexture()	
		
		b:PatSkin()
			
		if t then
			t:Point("TOPLEFT", 0, 0)
			t:Point("BOTTOMRIGHT", 0, 0)
		end
	end
end
hooksecurefunc("SendMailFrame_Update", MailFrameSkin)

