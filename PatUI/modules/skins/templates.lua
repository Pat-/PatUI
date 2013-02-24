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
	BattleTagInviteFrame,
	QueueStatusFrame,
	LFGDungeonReadyStatus,
	StackSplitFrame,
	ReportPlayerNameDialog,
	ReportCheatingDialog,
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
	
		local frame = _G["SideDressUpFrame"]
		
		local frames = {
			AuctionFrame,
			BrowseBidButton,
			BrowseBuyoutButton,
			BrowseCloseButton,
			BrowseResetButton,
			AuctionsCancelAuctionButton,
			AuctionsCloseButton,
			AuctionsCreateAuctionButton,
			BrowseSearchButton,
			BidBidButton,
			BidBuyoutButton,
			BidCloseButton,
			BrowseDropDown.backdrop,
			PriceDropDown.backdrop,
			DurationDropDown.backdrop,
			AuctionFrameBrowse.bg1,
			AuctionFrameBrowse.bg2,
			AuctionFrameBid.bg,
			AuctionFrameAuctions.bg1,
			AuctionFrameAuctions.bg2,
			BrowseName.backdrop,
			BrowseMinLevel.backdrop,
			BrowseMaxLevel.backdrop,
			BrowseBidPriceGold.backdrop,
			BrowseBidPriceSilver.backdrop,
			BrowseBidPriceCopper.backdrop,
			BidBidPriceGold.backdrop,
			BidBidPriceSilver.backdrop,
			BidBidPriceCopper.backdrop,
			AuctionsStackSizeEntry.backdrop,
			AuctionsNumStacksEntry.backdrop,
			StartPriceGold.backdrop,
			StartPriceSilver.backdrop,
			StartPriceCopper.backdrop,
			BuyoutPriceGold.backdrop,
			BuyoutPriceSilver.backdrop,
			BuyoutPriceCopper.backdrop,
			IsUsableCheckButton.backdrop,
			ShowOnPlayerCheckButton.backdrop,
			AuctionsItemButton,
		}
		
		for _, f in pairs(frames) do
			f:PatSkin()
		end
		
		DurationDropDown:ClearAllPoints()
		DurationDropDown:SetPoint("BOTTOMRIGHT", AuctionFrameAuctions.bg1, "BOTTOMRIGHT", 3, 50)
		
		for i=1, 3 do
			_G["AuctionFrameTab"..i].backdrop:PatSkin()
		end
		
		frame:HookScript("OnShow", function(self) 
			frame:PatSkin()
		end)
		
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
			GuildNewsFiltersFrame,
			GuildTextEditFrame,
			GuildFactionBar.backdrop,
			GuildXPBar.backdrop,
			GuildLatestPerkButton.backdrop,
			GuildNextPerkButton.backdrop,
			GuildPerksToggleButton.backdrop,
			GuildRosterShowOfflineButton.backdrop,
			GuildRosterViewDropdown.backdrop,
			GuildAddMemberButton,
			GuildViewLogButton,
			GuildControlButton,
			GuildTextEditFrameAcceptButton,
		}
		
		for _,f in pairs(frames) do
			f:PatSkin()
			if f.shadow then f.shadow:Hide() end
		end
		
		GuildFactionBar.backdrop:Point("TOPLEFT", GuildFactionBar.progress, "TOPLEFT", 0, 0)
		GuildFactionBar.backdrop:Point("BOTTOMRIGHT", GuildFactionBar, "BOTTOMRIGHT", 0, 2)
		
		GuildXPBar.backdrop:Point("TOPLEFT", GuildXPBar.progress, "TOPLEFT", 0, 0)
		GuildXPBar.backdrop:Point("BOTTOMRIGHT", GuildXPBar, "BOTTOMRIGHT", 0, 2)
		
		GuildLatestPerkButton.backdrop:Point("TOPLEFT", GuildLatestPerkButtonIconTexture, "TOPLEFT", 0, 0)
		GuildLatestPerkButton.backdrop:Point("BOTTOMRIGHT", GuildLatestPerkButtonIconTexture, "BOTTOMRIGHT", 0, 0)
		
		GuildNextPerkButton.backdrop:Point("TOPLEFT", GuildNextPerkButtonIconTexture, "TOPLEFT", 0, 0)
		GuildNextPerkButton.backdrop:Point("BOTTOMRIGHT", GuildNextPerkButtonIconTexture, "BOTTOMRIGHT", 0, 0)
		
		for i=1, 5 do
			_G["GuildFrameTab"..i].backdrop:PatSkin()
		end
		
		for i=1, 7 do
			_G["GuildNewsFilterButton"..i].backdrop:PatSkin()
		end
		
		GuildMemberDetailFrame:Point("TOPLEFT", GuildFrame, "TOPRIGHT", 4, -28)
		
	elseif(addon == "Blizzard_GuildBankUI") then
	
		GuildBankFrame:PatSkin()
		
		for i=1, 4 do
			_G["GuildBankFrameTab"..i].backdrop:PatSkin()
		end
		
	elseif(addon == "Blizzard_MacroUI") then
	
		MacroFrame:PatSkin()
		
		MacroPopupFrame:PatSkin()
		
	elseif(addon == "Blizzard_VoidStorageUI") then
	
		VoidStorageFrame:PatSkin()
		
	elseif(addon == "Blizzard_ReforgingUI") then
	
		ReforgingFrame:PatSkin()
		
	elseif(addon == "Blizzard_TrainerUI") then
	
		ClassTrainerFrame.backdrop:PatSkin()
		
	elseif(addon == "Blizzard_InspectUI") then
	
		InspectFrame.backdrop:PatSkin()
		
	elseif(addon == "Blizzard_TradeSkillUI") then
	
		TradeSkillFrame:PatSkin()
		
	elseif(addon == "Blizzard_ItemAlterationUI") then
	
		TransmogrifyArtFrame:PatSkin()
		
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
		
		local frames = {
			EncounterJournal,
			EncounterJournalNavBarHomeButton,
		}
		
		for _,f in pairs(frames) do
			f:SetBackdropBorderColor(0, 0, 0, 0)
			f:SetBorder(false, true)
			f:HideInsets()
		end
		
		EncounterJournalEncounterFrameInfoLootScrollFrameScrollBar:SkinScrollBar()
		EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollBar:SkinScrollBar()
		EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollBar:SkinScrollBar()
		
		EncounterJournalNavBar.backdrop:PatSkin()
		
		EncounterJournal.backdrop:ClearAllPoints()
		EncounterJournal.backdrop2:ClearAllPoints()
		EncounterJournal.backdrop3:SetTexture(.05, .05, .05, 0.7)
		EncounterJournal.backdrop4:ClearAllPoints()
		
		EncounterJournalInstanceSelectDungeonTab.backdrop:PatSkin()
		EncounterJournalInstanceSelectRaidTab.backdrop:PatSkin()
		
	end
end

local Init = CreateFrame("Frame")
Init:RegisterEvent("ADDON_LOADED")
Init:SetScript("OnEvent", SkinBlizzardFrames)
