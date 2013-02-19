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
	SideDressUpFrame,
	QueueStatusFrame,
	LFGDungeonReadyStatus,
	StackSplitFrame,
}

local OnLoad = CreateFrame("Frame")
OnLoad:RegisterEvent("PLAYER_ENTERING_WORLD")
OnLoad:SetScript("OnEvent", function()
	for _,f in pairs(frames) do
		f:SetTemplate("Transparent")
		if f.backdrop and f.backdrop.shadow then f.backdrop.shadow:Hide() elseif f.shadow then f.shadow:Hide() end
		f:SetBackdropBorderColor(0, 0, 0, 0)
		f:SetBorder(false, true)
		f:HideInsets()
	end
end)

-- Since BNet Converstaion frame is Transparent in my UI give the List a Template so it looks nice.
BNConversationInviteDialogList:SetTemplate("Default")

WorldMapQuestRewardScrollFrameScrollBar:SkinScrollBar()

QueueStatusFrame:SetFrameStrata("HIGH")

TokenFrame:HookScript("OnShow", function()
	TokenFramePopup:SetTemplate("Transparent")
	TokenFramePopup:SetBackdropBorderColor(0, 0, 0, 0)
	TokenFramePopup:SetBorder(false, true)
	TokenFramePopup:HideInsets()
end)

local function UpdateFactionSkins()
	ReputationDetailFrame:SetTemplate("Transparent")
	ReputationDetailFrame:SetBackdropBorderColor(0, 0, 0, 0)
	ReputationDetailFrame:SetBorder(false, true)
	ReputationDetailFrame:HideInsets()
end
ReputationFrame:HookScript("OnShow", UpdateFactionSkins)

-----------------------------------------------
-- Method of Skinning other frames
-----------------------------------------------

local function SkinBlizzardFrames(self, event, addon)
	if(addon == "Blizzard_AchievementUI") then
	
		AchievementFrame.backdrop:SetTemplate("Transparent")
		AchievementFrame.backdrop:SetBackdropBorderColor(0, 0, 0, 0)
		AchievementFrame.backdrop:SetBorder(false, true)
		AchievementFrame.backdrop:HideInsets()
		
		AchievementFrameCategoriesContainer.backdrop:SetBackdropBorderColor(0, 0, 0, 0)
		AchievementFrameCategoriesContainer.backdrop:SetBorder(false, true)
		AchievementFrameCategoriesContainer.backdrop:HideInsets()
		
	elseif(addon == "Blizzard_ArchaeologyUI") then
	
		ArchaeologyFrame:SetTemplate("Transparent")
		ArchaeologyFrame.shadow:Hide()
		ArchaeologyFrame:SetBackdropBorderColor(0, 0, 0, 0)
		ArchaeologyFrame:SetBorder(false, true)
		ArchaeologyFrame:HideInsets()
		
	elseif(addon == "Blizzard_AuctionUI") then
	
		local frame = _G["SideDressUpFrame"]
	
		AuctionFrame:SetTemplate("Transparent")
		AuctionFrame:SetBackdropBorderColor(0, 0, 0, 0)
		AuctionFrame:SetBorder(false, true)
		AuctionFrame:HideInsets()
		AuctionFrame.shadow:Hide()
		
		frame:HookScript("OnShow", function(self) 
			frame:SetTemplate("Transparent") 
			frame:SetBackdropBorderColor(0, 0, 0, 0) 
			frame:SetBorder(false, true) 
			frame:HideInsets() 
		end)
		
	elseif(addon == "Blizzard_BarbershopUI") then
	
		BarberShopFrame:SetTemplate("Transparent")
		BarberShopFrame:SetBackdropBorderColor(0, 0, 0, 0)
		BarberShopFrame:SetBorder(false, true)
		BarberShopFrame:HideInsets()
		
	elseif(addon == "Blizzard_BindingUI") then
	
		KeyBindingFrame:SetTemplate("Transparent")
		KeyBindingFrame:SetBackdropBorderColor(0, 0, 0, 0)
		KeyBindingFrame:SetBorder(false, true)
		KeyBindingFrame:HideInsets()
		
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
			if f.shadow then f.shadow:Hide() end
			f:SetBackdropBorderColor(0, 0, 0, 0)
			f:SetBorder(false, true)
			f:HideInsets()
		end
		
		CalendarMassInviteCloseButton:StripTextures()
		
	elseif(addon == "Blizzard_TimeManager") then
	
		TimeManagerFrame:SetTemplate("Transparent")
		TimeManagerFrame:SetBackdropBorderColor(0, 0, 0, 0)
		TimeManagerFrame:SetBorder(false, true)
		TimeManagerFrame:HideInsets()

	elseif(addon == "Blizzard_TalentUI") then
	
		PlayerTalentFrame.backdrop:SetTemplate("Transparent")
		PlayerTalentFrame.backdrop:SetBackdropBorderColor(0, 0, 0, 0)
		PlayerTalentFrame.backdrop:SetBorder(false, true)
		PlayerTalentFrame.backdrop:HideInsets()
		
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
			if f.shadow then f.shadow:Hide() end
			f:SetBackdropBorderColor(0, 0, 0, 0)
			f:SetBorder(false, true)
			f:HideInsets()
		end
		
		GuildMemberDetailFrame:Point("TOPLEFT", GuildFrame, "TOPRIGHT", 4, -28)
		
	elseif(addon == "Blizzard_GuildBankUI") then
	
		GuildBankFrame:SetTemplate("Transparent")
		GuildBankFrame:SetBackdropBorderColor(0, 0, 0, 0)
		GuildBankFrame:SetBorder(false, true)
		GuildBankFrame:HideInsets()
		
	elseif(addon == "Blizzard_MacroUI") then
	
		MacroFrame:SetTemplate("Transparent")
		MacroFrame:SetBackdropBorderColor(0, 0, 0, 0)
		MacroFrame:SetBorder(false, true)
		MacroFrame:HideInsets()
		
		MacroPopupFrame:SetTemplate("Transparent")
		MacroPopupFrame:SetBackdropBorderColor(0, 0, 0, 0)
		MacroPopupFrame:SetBorder(false, true)
		MacroPopupFrame:HideInsets()
		
	elseif(addon == "Blizzard_VoidStorageUI") then
	
		VoidStorageFrame:SetTemplate("Transparent")
		VoidStorageFrame:SetBackdropBorderColor(0, 0, 0, 0)
		VoidStorageFrame:SetBorder(false, true)
		VoidStorageFrame:HideInsets()
		
	elseif(addon == "Blizzard_ReforgingUI") then
	
		ReforgingFrame:SetTemplate("Transparent")
		ReforgingFrame:SetBackdropBorderColor(0, 0, 0, 0)
		ReforgingFrame:SetBorder(false, true)
		ReforgingFrame:HideInsets()
		
	elseif(addon == "Blizzard_TrainerUI") then
	
		ClassTrainerFrame.backdrop:SetTemplate("Transparent")
		ClassTrainerFrame.backdrop:SetBackdropBorderColor(0, 0, 0, 0)
		ClassTrainerFrame.backdrop:SetBorder(false, true)
		ClassTrainerFrame.backdrop:HideInsets()
		
	elseif(addon == "Blizzard_InspectUI") then
	
		InspectFrame.backdrop:SetTemplate("Transparent")
		InspectFrame.backdrop:SetBackdropBorderColor(0, 0, 0, 0)
		InspectFrame.backdrop:SetBorder(false, true)
		InspectFrame.backdrop:HideInsets()
		
	elseif(addon == "Blizzard_TradeSkillUI") then
	
		TradeSkillFrame:SetTemplate("Transparent")
		TradeSkillFrame:SetBackdropBorderColor(0, 0, 0, 0)
		TradeSkillFrame:SetBorder(false, true)
		TradeSkillFrame:HideInsets()
		TradeSkillFrame.shadow:Hide()
		
	elseif(addon == "Blizzard_ItemAlterationUI") then
	
		TransmogrifyArtFrame:SetTemplate("Transparent")
		TransmogrifyArtFrame:SetBackdropBorderColor(0, 0, 0, 0)
		TransmogrifyArtFrame:SetBorder(false, true)
		TransmogrifyArtFrame:HideInsets()
		
	elseif(addon == "Blizzard_LookingForGuildUI") then
	
		LookingForGuildFrame:SetTemplate("Transparent")
		LookingForGuildFrame:SetBackdropBorderColor(0, 0, 0, 0)
		LookingForGuildFrame:SetBorder(false, true)
		LookingForGuildFrame:HideInsets()
		
	elseif(addon == "Blizzard_ItemSocketingUI") then
	
		ItemSocketingFrame:SetTemplate("Transparent")
		ItemSocketingFrame:SetBackdropBorderColor(0, 0, 0, 0)
		ItemSocketingFrame:SetBorder(false, true)
		ItemSocketingFrame:HideInsets()
		
		ItemSocketingScrollFrame:SetTemplate("Default")
		ItemSocketingScrollFrame:SetHeight(ItemSocketingScrollFrame:GetHeight() + 10)
		ItemSocketingScrollFrame:SetFrameLevel(ItemSocketingFrame:GetFrameLevel() + 4)
		
	elseif(addon == "Blizzard_ItemUpgradeUI") then
		ItemUpgradeFrame:SetTemplate("Transparent")
		ItemUpgradeFrame:SetBackdropBorderColor(0, 0, 0, 0)
		ItemUpgradeFrame:SetBorder(false, true)
		ItemUpgradeFrame:HideInsets()
		
	elseif(addon == "Blizzard_DebugTools") then
		
		ScriptErrorsFrame:SetTemplate("Transparent")
		ScriptErrorsFrame:SetBackdropBorderColor(0, 0, 0, 0)
		ScriptErrorsFrame:SetBorder(false, true)
		ScriptErrorsFrame:HideInsets()
		
	end
end

local Init = CreateFrame("Frame")
Init:RegisterEvent("ADDON_LOADED")
Init:SetScript("OnEvent", SkinBlizzardFrames)

ReportCheatingDialog:SetTemplate("Transparent")
ReportCheatingDialog:SetBorder(false, true)
ReportCheatingDialog:SetBackdropBorderColor(0, 0, 0, 0)
ReportCheatingDialog:HideInsets()
