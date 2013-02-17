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
	PVPFrame.backdrop,
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
}

local OnLoad = CreateFrame("Frame")
OnLoad:RegisterEvent("PLAYER_ENTERING_WORLD")
OnLoad:SetScript("OnEvent", function()
	for _,f in pairs(frames) do
		f:SetTemplate("Transparent")
		if f.backdrop and f.backdrop.shadow then f.backdrop.shadow:Hide() elseif f.shadow then f.shadow:Hide() end
		f:SetBackdropBorderColor(0,0,0,0)
		f:SetBorder(false, true)
		f:HideInsets()
	end
end)

-- Since BNet Converstaion frame is Transparent in my UI give the List a Template so it looks nice.
BNConversationInviteDialogList:SetTemplate("Default")

WorldMapQuestRewardScrollFrameScrollBar:SkinScrollBar()

TokenFrame:HookScript("OnShow", function()
	TokenFramePopup:SetTemplate("Transparent")
end)

local function UpdateFactionSkins()
	ReputationDetailFrame:SetTemplate("Transparent")
end
ReputationFrame:HookScript("OnShow", UpdateFactionSkins)

-----------------------------------------------
-- Method of Skinning other frames
-----------------------------------------------

local function SkinBlizzardFrames(self, event, addon)
	if(addon == "Blizzard_AchievementUI") then
	
		AchievementFrame.backdrop:SetTemplate("Transparent")
		AchievementFrame:ThickBorder()
		
	elseif(addon == "Blizzard_ArchaeologyUI") then
	
		ArchaeologyFrame:SetTemplate("Transparent")
		ArchaeologyFrame:ThickBorder()
		ArchaeologyFrame.shadow:Hide()
		
	elseif(addon == "Blizzard_AuctionUI") then
	
		AuctionFrame:SetTemplate("Transparent")
		AuctionFrame:ThickBorder()
		AuctionFrame.shadow:Hide()
		SideDressUpFrame:SetTemplate("Transparent")
		SideDressUpFrame:ThickBorder()
		
	elseif(addon == "Blizzard_BarbershopUI") then
	
		BarberShopFrame:SetTemplate("Transparent")
		BarberShopFrame:ThickBorder()
		
	elseif(addon == "Blizzard_BindingUI") then
	
		KeyBindingFrame:SetTemplate("Transparent")
		KeyBindingFrame:ThickBorder()
		
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
			f:SetTemplate("Transparent")
			f:ThickBorder()
			if f.shadow then f.shadow:Hide() end
		end
		
		CalendarMassInviteCloseButton:StripTextures()
		
	elseif(addon == "Blizzard_TimeManager") then
	
		TimeManagerFrame:SetTemplate("Transparent")
		TimeManagerFrame:ThickBorder()
		
	elseif(addon == "Blizzard_TalentUI") then
	
		PlayerTalentFrame.backdrop:SetTemplate("Transparent")
		PlayerTalentFrame.backdrop:ThickBorder()
		
	elseif(addon == "Blizzard_GuildUI") then
	
		local frames = {
			GuildFrame,
			GuildMemberDetailFrame,
			GuildLogFrame,
			GuildNewsFiltersFrame,
			GuildTextEditFrame,
		}
		
		for _,f in pairs(frames) do
			f:SetTemplate("Transparent")
			f:ThickBorder()
			if f.shadow then f.shadow:Hide() end
		end
		
		GuildMemberDetailFrame:Point("TOPLEFT", GuildFrame, "TOPRIGHT", 4, -28)
		
	elseif(addon == "Blizzard_GuildBankUI") then
	
		GuildBankFrame:SetTemplate("Transparent")
		GuildBankFrame:ThickBorder()
		
	elseif(addon == "Blizzard_MacroUI") then
	
		MacroFrame:SetTemplate("Transparent")
		MacroFrame:ThickBorder()
		
	elseif(addon == "Blizzard_VoidStorageUI") then
	
		VoidStorageFrame:SetTemplate("Transparent")
		VoidStorageFrame:ThickBorder()
		
	elseif(addon == "Blizzard_ReforgingUI") then
	
		ReforgingFrame:SetTemplate("Transparent")
		ReforgingFrame:ThickBorder()
		
	elseif(addon == "Blizzard_TrainerUI") then
	
		ClassTrainerFrame.backdrop:SetTemplate("Transparent")
		ClassTrainerFrame.backdrop:ThickBorder()
		
	elseif(addon == "Blizzard_InspectUI") then
	
		InspectFrame.backdrop:SetTemplate("Transparent")
		InspectFrame.backdrop:ThickBorder()
		
	elseif(addon == "Blizzard_TradeSkillUI") then
	
		TradeSkillFrame:SetTemplate("Transparent")
		TradeSkillFrame:ThickBorder()
		TradeSkillFrame.shadow:Hide()
		
	elseif(addon == "Blizzard_ItemAlterationUI") then
	
		TransmogrifyArtFrame:SetTemplate("Transparent")
		TransmogrifyArtFrame:ThickBorder()
		
	elseif(addon == "Blizzard_LookingForGuildUI") then
	
		LookingForGuildFrame:SetTemplate("Transparent")
		LookingForGuildFrame:ThickBorder()
		
	elseif(addon == "Blizzard_ItemSocketingUI") then
	
		ItemSocketingFrame:SetTemplate("Transparent")
		ItemSocketingFrame:ThickBorder()
		ItemSocketingScrollFrame:SetTemplate("Default")
		ItemSocketingScrollFrame:SetHeight(ItemSocketingScrollFrame:GetHeight() + 10)
		ItemSocketingScrollFrame:SetFrameLevel(ItemSocketingFrame:GetFrameLevel() + 4)
		
	end
end

local Init = CreateFrame("Frame")
Init:RegisterEvent("ADDON_LOADED")
Init:SetScript("OnEvent", SkinBlizzardFrames)


ReportCheatingDialog:StripTextures()
ReportCheatingDialog:SetTemplate("Transparent")
ReportCheatingDialog:ThickBorder()
ReportCheatingDialogReportButton:SkinButton()
ReportCheatingDialogCancelButton:SkinButton()
ReportCheatingDialogCommentFrame:StripTextures()
ReportCheatingDialogCommentFrameEditBox:SkinEditBox()
