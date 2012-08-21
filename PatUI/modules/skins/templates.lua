local P, C, L = unpack(Tukui)

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
}

local OnLoad = CreateFrame("Frame")
OnLoad:RegisterEvent("PLAYER_ENTERING_WORLD")
OnLoad:SetScript("OnEvent", function()
	for _,f in pairs(frames) do
		f:SetTemplate("Transparent")
		f:ThickBorder()
	end
end)

-----------------------------------------------
--Test to skin other frames
-----------------------------------------------

local myAddon = "PatUI"

local function SkinBlizzardFrames(self, event, addon)
	if(addon == myAddon) then

	elseif(addon == "Blizzard_AchievementUI") then
		AchievementFrame.backdrop:SetTemplate("Transparent")
		AchievementFrame:ThickBorder()
	elseif(addon == "Blizzard_ArchaeologyUI") then
		ArchaeologyFrame:SetTemplate("Transparent")
		ArchaeologyFrame:ThickBorder()
	elseif(addon == "Blizzard_AuctionUI") then
		AuctionFrame:SetTemplate("Transparent")
		AuctionFrame:ThickBorder()
	elseif(addon == "Blizzard_BarbershopUI") then
		BarberShopFrame:SetTemplate("Transparent")
		BarberShopFrame:ThickBorder()
	elseif(addon == "Blizzard_BindingUI") then
		KeyBindingFrame:SetTemplate( "Transparent")
		KeyBindingFrame:ThickBorder()
	elseif(addon == "Blizzard_Calendar") then
		CalendarFrame:SetTemplate("Transparent")
		CalendarCreateEventFrame:SetTemplate("Transparent")
		CalendarTexturePickerFrame:SetTemplate("Transparent")
		CalendarFrame:ThickBorder()
		CalendarCreateEventFrame:ThickBorder()
		CalendarTexturePickerFrame:ThickBorder()
		CalendarViewHolidayFrame:SetTemplate("Transparent")
		CalendarViewHolidayFrame:ThickBorder()
	elseif(addon == "Blizzard_TimeManager") then
		TimeManagerFrame:SetTemplate("Transparent")
		TimeManagerFrame:ThickBorder()
	elseif(addon == "Blizzard_TalentUI") then
		PlayerTalentFrame.backdrop:SetTemplate("Transparent")
		PlayerTalentFrame.backdrop:ThickBorder()
	elseif(addon == "Blizzard_GuildUI") then
		GuildFrame:SetTemplate("Transparent")
		GuildFrame:ThickBorder()
		GuildMemberDetailFrame:SetTemplate("Transparent")
		GuildMemberDetailFrame:ThickBorder()
		GuildLogFrame:SetTemplate("Transparent")
		GuildLogFrame:ThickBorder()
		GuildNewsFiltersFrame:SetTemplate("Transparent")
		GuildNewsFiltersFrame:ThickBorder()
		GuildTextEditFrame:SetTemplate("Transparent")
		GuildTextEditFrame:ThickBorder()
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
	elseif(addon == "Blizzard_ItemAlterationUI") then
		TransmogrifyArtFrame:SetTemplate("Transparent")
		TransmogrifyArtFrame:ThickBorder()
	elseif(addon == "Blizzard_LookingForGuildUI") then
		LookingForGuildFrame:SetTemplate("Transparent")
		LookingForGuildFrame:ThickBorder()
	end
end

local Init = CreateFrame("Frame")
Init:RegisterEvent("ADDON_LOADED")
Init:SetScript("OnEvent", SkinBlizzardFrames)
