local P, C, L, G = unpack(Tukui)

-- Overriding defualt Tukui Skin Templates here if I can.
local frames = {
	CharacterFrame,
	FriendsFrame,
	SpellBookFrame.backdrop,
	QuestLogFrame,
	VideoOptionsFrame,
	InterfaceOptionsFrame,
	WorldMapFrame.backdrop,
	QuestFrame.backdrop,
	GossipFrame.backdrop,
	GameMenuFrame,
	WorldStateScoreFrame,
	MailFrame,
	OpenMailFrame,
	PVEFrame.backdrop,
	MerchantFrame,
	MerchantBuyBackItem,
	TukuiInstallFrame,
	ItemTextFrame,
	LFGDungeonReadyPopup,
	QuestLogDetailFrame,
	GuildInviteFrame,
	DressUpFrame.backdrop,
	ChatConfigFrame,
	StaticPopup1,
	StaticPopup3,
	PetJournalParent,
	TukuiPopupDialog1,
	TukuiPopupDialogButtonAccept1,
	TukuiPopupDialogButtonCancel1,
	TradeFrame.backdrop,
	FriendsFriendsFrame.backdrop,
	BNConversationInviteDialog,
	AddFriendFrame,
	LootHistoryFrame,
	FriendsFrameBattlenetFrame.BroadcastFrame,
	RaidInfoFrame.backdrop,
	TukuiChatCopyFrame,
	RaidBrowserFrame.backdrop,
	BattleTagInviteFrame,
	QueueStatusFrame,
	LFGDungeonReadyStatus,
	StackSplitFrame,
	ReportPlayerNameDialog,
	ReportCheatingDialog,
	ChatConfigBackgroundFrame,
	ChatConfigCategoryFrame,
	HelpFrame.backdrop,
	HelpFrameMainInset.backdrop,
	HelpFrameLeftInset.backdrop,
	TicketStatusFrameButton,
	ReadyCheckFrame,
}

local OnLoad = CreateFrame("Frame")
OnLoad:RegisterEvent("PLAYER_ENTERING_WORLD")
OnLoad:SetScript("OnEvent", function()
	for _,f in pairs(frames) do
		f:PatSkin()
		if f.backdrop and f.backdrop.shadow then f.backdrop.shadow:Hide() elseif f.shadow then f.shadow:Hide() end
	end
end)

-- Since BNet Converstaion frame is Transparent in my UI give the List a Template so it looks nice.
BNConversationInviteDialogList:SetTemplate("Default")

QueueStatusFrame:SetFrameStrata("HIGH")

TokenFrame:HookScript("OnShow", function()
	TokenFramePopup:PatSkin()
end)

local function UpdateFactionSkins()
	ReputationDetailFrame:PatSkin()
	ReputationDetailFrame:SetAlpha(0.7)
end
ReputationFrame:HookScript("OnShow", UpdateFactionSkins)

-----------------------------------------------
-- Method of Skinning other frames
-----------------------------------------------

local function SkinBlizzardFrames(self, event, addon)
	if(addon == "Blizzard_AchievementUI") then
	
		AchievementFrame.backdrop:PatSkin()
		
		AchievementFrameCategoriesContainer.backdrop:PatSkin()
		
		for i=1, 3 do
			_G["AchievementFrameTab"..i].backdrop:PatSkin()
		end
		
	elseif(addon == "Blizzard_ArchaeologyUI") then
	
		ArchaeologyFrame:PatSkin()
		
	elseif(addon == "Blizzard_AuctionUI") then
		
		AuctionFrame:PatSkin()
		AuctionFrameBrowse.bg1:PatSkin()
		AuctionFrameBrowse.bg2:PatSkin()
		AuctionFrameBid.bg:PatSkin()
		AuctionFrameAuctions.bg1:PatSkin()
		AuctionFrameAuctions.bg2:PatSkin()
		
		for i=1, 3 do
			_G["AuctionFrameTab"..i].backdrop:PatSkin()
		end
		
		local frame = _G["SideDressUpFrame"]
		
		frame:HookScript("OnShow", function(self) 
			frame:PatSkin()
		end)
		
	elseif(addon == "Blizzard_BlackMarketUI") then
		
		BlackMarketFrame:PatSkin()
		
	elseif(addon == "Blizzard_BarbershopUI") then
	
		BarberShopFrame:PatSkin()
		
	elseif(addon == "Blizzard_BindingUI") then
	
		KeyBindingFrame:PatSkin()
		
	elseif(addon == "Blizzard_Calendar") then
	
		local frames = {
			CalendarFrame,
			CalendarCreateEventFrame,
			CalendarTexturePickerFrame,
			CalendarViewEventFrame,
			CalendarViewHolidayFrame,
			CalendarViewRaidFrame,
			CalendarMassInviteFrame,
		}
		
		for _,f in pairs(frames) do
			f:PatSkin()
			if f.shadow then f.shadow:Hide() end
		end
		
		CalendarMassInviteCloseButton:StripTextures()
		
	elseif(addon == "Blizzard_TimeManager") then
	
		TimeManagerFrame:PatSkin()

	elseif(addon == "Blizzard_TalentUI") then
	
		PlayerTalentFrame.backdrop:PatSkin()
		
		for i=1, 3 do
			_G["PlayerTalentFrameTab"..i].backdrop:PatSkin()
		end
		
	elseif(addon == "Blizzard_GuildUI") then
	
		local frames = {
			GuildFrame,
			GuildMemberDetailFrame,
			GuildLogFrame,
			GuildTextEditFrame,
			GuildNewsFiltersFrame,
			GuildFactionBar.backdrop,
			GuildXPBar.backdrop,
		}
		
		for _,f in pairs(frames) do
			f:PatSkin()
			if f.shadow then f.shadow:Hide() end
		end
		
		for i=1, 5 do
			_G["GuildFrameTab"..i].backdrop:PatSkin()
		end
		
		GuildMemberDetailFrame:Point("TOPLEFT", GuildFrame, "TOPRIGHT", 4, -28)
		
		GuildXPBar.backdrop:Point("TOPLEFT", GuildXPBar.progress, "TOPLEFT", -2, 2)
		GuildXPBar.backdrop:Point("BOTTOMRIGHT", GuildXPBar, "BOTTOMRIGHT", 2, 0)

		GuildFactionBar.backdrop:Point("TOPLEFT", GuildFactionBar.progress, "TOPLEFT", -2, 2)
		GuildFactionBar.backdrop:Point("BOTTOMRIGHT", GuildFactionBar, "BOTTOMRIGHT", 0, 1)
		
	elseif(addon == "Blizzard_GuildControlUI") then
	
		GuildControlUI:PatSkin()
		
	elseif(addon == "Blizzard_GuildBankUI") then
	
		GuildBankFrame:PatSkin()
		GuildBankPopupFrame:PatSkin()
		
		for i=1, 4 do
			_G["GuildBankFrameTab"..i].backdrop:PatSkin()
		end
		
	elseif(addon == "Blizzard_MacroUI") then
	
		MacroFrame:PatSkin()
		
		MacroPopupFrame:PatSkin()
		
	elseif(addon == "Blizzard_VoidStorageUI") then
	
		VoidStorageFrame:PatSkin()
		SideDressUpFrame.backdrop:PatSkin()
		
	elseif(addon == "Blizzard_ReforgingUI") then
	
		ReforgingFrame:PatSkin()
		
	elseif(addon == "Blizzard_TrainerUI") then
	
		ClassTrainerFrame.backdrop:PatSkin()
		
	elseif(addon == "Blizzard_InspectUI") then
	
		InspectFrame.backdrop:PatSkin()
		
		for i=1, 4 do
			_G["InspectFrameTab"..i].backdrop:PatSkin()
		end
		
	elseif(addon == "Blizzard_TradeSkillUI") then
	
		TradeSkillFrame:PatSkin()
		
	elseif(addon == "Blizzard_ItemAlterationUI") then
	
		TransmogrifyArtFrame:PatSkin()
		TransmogrifyConfirmationPopup:StripTextures()
		TransmogrifyConfirmationPopup:PatSkin()
		TransmogrifyConfirmationPopup.Button1:SkinButton()
		TransmogrifyConfirmationPopup.Button2:SkinButton()
		TransmogrifyConfirmationPopupItemFrame1:HandleItemButton(true)
		TransmogrifyConfirmationPopupItemFrame2:HandleItemButton(true)
		
	elseif(addon == "Blizzard_LookingForGuildUI") then
	
		LookingForGuildFrame:PatSkin()
		
	elseif(addon == "Blizzard_ItemSocketingUI") then
	
		ItemSocketingFrame:PatSkin()
		
		ItemSocketingScrollFrame:SetTemplate("Default")
		ItemSocketingScrollFrame:SetHeight(ItemSocketingScrollFrame:GetHeight() + 10)
		ItemSocketingScrollFrame:SetFrameLevel(ItemSocketingFrame:GetFrameLevel() + 4)
		
	elseif(addon == "Blizzard_ItemUpgradeUI") then
	
		ItemUpgradeFrame:PatSkin()

	elseif(addon == "Blizzard_DebugTools") then
		
		ScriptErrorsFrame:PatSkin()
	
	elseif(addon == "Blizzard_EncounterJournal") then
		
		EncounterJournal:SetTemplate("Transparent")
		
		EncounterJournalEncounterFrameInfoLootScrollFrameScrollBar:SkinScrollBar()
		EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollBar:SkinScrollBar()
		EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollBar:SkinScrollBar()
		EncounterJournalEncounterFrameInfoBossesScrollFrameScrollBar:SkinScrollBar()
		
		EncounterJournalNavBar.backdrop:PatSkin()
		
		EncounterJournal.backdrop:ClearAllPoints()
		EncounterJournal.backdrop2:ClearAllPoints()
		EncounterJournal.backdrop3:SetTexture(.05, .05, .05, 0.1)
		EncounterJournal.backdrop4:ClearAllPoints()
		
	elseif(addon == "Blizzard_PVPUI") then
	
		PVPUIFrame:PatSkin()
		
	elseif(addon == "Blizzard_GMSurveyUI") then
	
		GMSurveyFrame.backdrop:PatSkin()

	end
end

local Init = CreateFrame("Frame")
Init:RegisterEvent("ADDON_LOADED")
Init:SetScript("OnEvent", SkinBlizzardFrames)

for i=1, 4 do
	_G["CharacterFrameTab"..i].backdrop:PatSkin()
	_G["SpellBookFrameTabButton"..i].backdrop:PatSkin()
	_G["FriendsFrameTab"..i].backdrop:PatSkin()
end

for i=1, 3 do
	_G["FriendsTabHeaderTab"..i].backdrop:PatSkin()
end

for i=1, 2 do
	_G["PetJournalParentTab"..i].backdrop:PatSkin()
	_G["MailFrameTab"..i].backdrop:PatSkin()
	_G["MerchantFrameTab"..i].backdrop:PatSkin()
end

InterfaceOptionsControlsPanelBlockChatChannelInvites:SkinCheckBox()

FriendsTabHeaderRecruitAFriendButton:SkinButton()
FriendsTabHeaderRecruitAFriendButton:StyleButton()
FriendsTabHeaderRecruitAFriendButtonIcon:SetDrawLayer("OVERLAY")
FriendsTabHeaderRecruitAFriendButtonIcon:SetTexCoord(.08, .92, .08, .92)
FriendsTabHeaderRecruitAFriendButtonIcon:SetInside()

RecruitAFriendFrame:StripTextures()
RecruitAFriendFrame:PatSkin()
RecruitAFriendNameEditBox:SkinEditBox()
RecruitAFriendFrameSendButton:SkinButton()
RecruitAFriendFrameCloseButton:SkinCloseButton()
RecruitAFriendNoteFrame:StripTextures()
RecruitAFriendNoteFrame:SetTemplate("Default")
RecruitAFriendNoteFrameScrollFrameScrollBar:SkinScrollBar()

ScrollOfResurrectionSelectionFrame:PatSkin()

GearManagerDialogPopup:SetAlpha(0.8)
GearManagerDialogPopup:ThickBorder()

LFRBrowseFrameListScrollFrameScrollBar:SkinScrollBar()
LFRBrowseFrameRoleInset:StripTextures()