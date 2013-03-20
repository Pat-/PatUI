local P, C, L, G = unpack(Tukui)

------------------------------------------------------------------------
-- Working on own AFK Banner now, using one from NishaUI as base.
------------------------------------------------------------------------

local PName = P.myname
local PLevel = P.level
local PClass = UnitClass("player")
local PRace = P.myrace
local PFaction = P.myfaction
local PGuild
if(IsInGuild()) then
	PGuild = select(1, GetGuildInfo("player"))
else
	PGuild = " "
end
local color = RAID_CLASS_COLORS[P.myclass]

P.AFK_LIST = {
	"Nearby questgivers that are awaiting your return are shown as a question mark on your mini-map.",
	"Your spell casting can be cancelled by moving, jumping or hitting the escape key.",
	"Clicking on a player name in the chat window lets you send a private message to them.",
	"If you <Shift>Click on a player name in the chat window it tells you additional information about them.",
	"You can <Control>Click on an item to see how you would look wearing that item.",
	"An item with its name in gray is a poor quality item and generally can be sold to a vendor.",
	"An item with its name in white is useful to players in some way and can be used or sold at the auction house.",
	"If you are lost trying to complete a quest, the quest log will often tell you what to do next.",
	"You can send mail to other players or even to your other characters from any mailbox in game.",
	"You can <Shift>Click on an item to place an item link into a chat message.",
	"You can remove a friendly spell enhancement on yourself by right-clicking on the spell effect icon.",
	"When you learn a profession or secondary skill the button that allows you to perform that skill is found in the general tab of your spellbook.",
	"All of your action bars can have their hotkeys remapped in the key bindings interface.",
	"If a profession trainer cannot teach you any more, they will generally tell you where to go to get further training.",
	"On your character sheet is a reputation tab that tells you your status with different groups.",
	"You can use the Tab key to select nearby enemies in front of you.",
	"If you are having trouble finding something in a capital city, try asking a guard for directions.",
	"You can perform many fun actions with the emote system, for instance you can type /dance to dance.",
	"A Blizzard employee will NEVER ask for your password.",
	"You can only know two professions at a time, but you can learn all of the secondary skills (archaeology, fishing, cooking and first-aid).",
	"You can right-click on a beneficial spell that has been cast on you to dismiss it.",
	"The interface options menu <ESC> has lots of ways to customize your game play.",
	"You can turn off the slow scrolling of quest text in the interface options menu.",
	"Spend your talent points carefully as once your talents are chosen, you must spend gold to unlearn them.",
	"A mail icon next to the minimap means you have new mail. Visit a mailbox to retrieve it.",
	"You can add additional action bars to your game interface from the interface options menu.",
	"If you hold down <Shift> while right-clicking on a target to loot, you will automatically loot all items on the target.",
	"Your character can eat and drink at the same time.",
	"If you enjoyed playing with someone, put them on your friends list!",
	"Use the Looking for Group interface (\"I\" Hotkey) to find a group or add more players to your group.",
	"There are a number of different loot options when in a group. The group leader can right-click their own portrait to change the options.",
	"You can choose not to display your helm and/or cloak with an option from the interface options menu.",
	"You can target members of your party with the function keys. F1 targets you; F2 targets the second party member.",
	"Being polite while in a group with others will get you invited back!",
	"Remember to take all things in moderation (even World of Warcraft!)",
	"You can click on a faction in the reputation pane to get additional information and options about that faction.",
	"A monster with a silver dragon around its portrait is a rare monster with better than average treasure.",
	"If you mouse over a chat pane it will become visible and you can right-click on the chat pane tab for options.",
	"Sharing an account with someone else can compromise its security.",
	"You can display the duration of beneficial spells on you from the interface options menu.",
	"You can lock your action bar so you don't accidentally move spells. This is done using the interface options menu.",
	"You can assign a Hotkey to toggle locking/unlocking your action bar. Just look in the Key Bindings options to set it.",
	"You can cast a spell on yourself without deselecting your current target by holding down <Alt> while pressing your hotkey.",
	"Ensure that all party members are on the same stage of an escort quest before beginning it.",
	"You're much less likely to encounter wandering monsters while following a road.",
	"Killing guards gives no honor.",
	"You can hide your interface with <Alt>Z and take screenshots with <Print Screen>.",
	"Typing /macro will bring up the interface to create macros.",
	"Enemy players whose names appear in gray are much lower level than you are and will not give honor when killed.",
	"From the Raid UI you can drag a player to the game field to see their status or drag a class icon to see all members of that class.",
	"A blue question mark above a quest giver means the quest is repeatable.",
	"the assist button (F key) while targeting another player, and it will target the same target as that player.",
	"<Shift>Clicking on an item being sold by a vendor will let you select how many of that item you wish to purchase.",
	"Playing in a battleground on its holiday weekend increases your honor gained.",
	"If you are having trouble fishing in an area, try attaching a lure to your fishing pole.",
	"You can view messages you previously sent in chat by pressing <Alt> and the up arrow key.",
	"You can Shift-Click on an item stack to split it into smaller stacks.",
	"Pressing both mouse buttons simultaneously will make your character run.",
	"When replying to a tell from a player (Default 'R'), the <TAB> key cycles through people you have recently replied to.",
	"Clicking an item name that appears bracketed in chat will tell you more about the item.",
	"It's considered polite to talk to someone before inviting them into a group, or opening a trade window.",
	"Pressing 'v' will toggle the display of a health bar over nearby enemies.",
	"Your items do not suffer durability damage when you are killed by an enemy player.",
	"<Shift>click on a quest in your quest log to toggle quest tracking for that quest.",
	"There is no cow level.",
	"The auction houses in each of your faction's major cities are linked together.",
	"Nearby questgivers that are awaiting your return are shown as a yellow question mark on your mini-map.",
	"Quests completed at maximum level award money instead of experience.",
	"<Shift>-B will open all your bags at once.",
	"When interacting with other players a little kindness goes a long way!",
	"Bring your friends to Azeroth, but don't forget to go outside Azeroth with them as well.",
	"If you keep an empty mailbox, the mail icon will let you know when you have new mail waiting!",
	"Never give another player your account information.",
	"When a player not in your group damages a monster before you do, it will display a gray health bar and you will get no loot or experience from killing it.",
	"You can see the spell that your current target is casting by turning on the 'Show Enemy Cast Bar' options in the basic interface options.",
	"You can see the target of your current target by turning on the 'Show Target of Target' option in the advanced interface options tab.",
	"You can access the map either by clicking the map button in the upper left of the mini-map or by hitting the 'M' key.",
	"Many high level dungeons have a heroic mode setting. Heroic mode dungeons are tuned for level 70 players and have improved loot.",
	"Spend your honor points for powerful rewards at the Champion's Hall (Alliance) or Hall of Legends (Horde).",
	"The honor points you earn each day become available immediately. Check the PvP interface to see how many points you have to spend.",
	"You can turn these tips off in the Interface menu.",
	"Dungeon meeting stones can be used to summon absent party members. It requires two players at the stone to do a summoning.",
	"The Parental Controls section of the Account Management site offers tools to help you manage your play time.",
	"Quest items that are in the bank cannot be used to complete quests.",
	"A quest marked as (Failed) in the quest log can be abandoned and then reacquired from the quest giver.",
	"The number next to the quest name in your log is how many other party members are on that quest.",
	"You cannot advance quests other than (Raid) quests while you are in a raid group.",
	"You cannot cancel your bids in the auction house so bid carefully.",
	"To enter a chat channel, type /join [channel name] and /leave [channel name] to exit.",
	"Mail will be kept for a maximum of 30 days before it disappears.",
	"Once you get a key, they can be found in a special key ring bag that is to the left of your bags.",
	"You can replace a gem that is already socketed into your item by dropping a new gem on top of it in the socketing interface.",
	"City Guards will often give you directions to other locations of note in the city.",
	"You can repurchase items you have recently sold to a vendor from the buyback tab.",
	"A group leader can reset their instances from their portrait right-click menu.",
	"You can always get a new hearthstone from any Innkeeper.",
	"You can open a small map of the current zone either with Shift-M or as an option from the world map.",
	"Players cannot dodge, parry, or block attacks that come from behind them.",
	"If you Right Click on a name in the combat log a list of options will appear.",
	"You can only have one Battle Elixir and one Guardian Elixir on you at a time.",
	"The calendar can tell you when raids reset.",
	" Creatures cannot make critical hits with spells, but players can.",
	"Creatures can dodge attacks from behind, but players cannot. Neither creatures nor players can parry attacks from behind.",
	"Players with the Inscription profession can make glyphs to improve your favorite spells and abilities.",
	"Don't stand in the fire!",
	"The Raid UI can be customized in a number of different ways, such as how it shows debuffs or current health.",
	"Dungeons are more fun when everyone works together as a team. Be patient with players who are still learning the game.",
}

local PatAFKPanel = CreateFrame("Frame", "PatAFKPanel", nil)
PatAFKPanel:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -2, -2)
PatAFKPanel:SetPoint("TOPRIGHT", UIParent, "BOTTOMRIGHT", 2, 150)
PatAFKPanel:SetTemplate("Transparent")
PatAFKPanel:Hide()

local PatAFKPanelTop = CreateFrame("Frame", "PatAFKPanelTop", nil)
PatAFKPanelTop:SetPoint("TOPLEFT", UIParent, "TOPLEFT",-2, 2)
PatAFKPanelTop:SetPoint("BOTTOMRIGHT", UIParent, "TOPRIGHT", 2, -80)
PatAFKPanelTop:SetTemplate("Transparent")
PatAFKPanelTop:SetFrameStrata("FULLSCREEN")
PatAFKPanelTop:Hide()

PatAFKPanelTop.Text = PatAFKPanelTop:CreateFontString(nil, "OVERLAY")
PatAFKPanelTop.Text:SetPoint("CENTER", PatAFKPanelTop, "CENTER", 0, 0)
PatAFKPanelTop.Text:SetFont(C.media.font, 40, "OUTLINE")
PatAFKPanelTop.Text:SetText("|cff18AA18PatUI v" .. GetAddOnMetadata("PatUI", "Version") .. "|r")

PatAFKPanelTop.DateText = PatAFKPanelTop:CreateFontString(nil, "OVERLAY")
PatAFKPanelTop.DateText:SetPoint("BOTTOMLEFT", PatAFKPanelTop, "BOTTOMRIGHT", -100, 44)
PatAFKPanelTop.DateText:SetFont(C.media.font, 15, "OUTLINE")

PatAFKPanelTop.ClockText = PatAFKPanelTop:CreateFontString(nil, "OVERLAY")
PatAFKPanelTop.ClockText:SetPoint("BOTTOMLEFT", PatAFKPanelTop, "BOTTOMRIGHT", -100, 20)
PatAFKPanelTop.ClockText:SetFont(C.media.font, 20, "OUTLINE")

PatAFKPanelTop.PlayerNameText = PatAFKPanelTop:CreateFontString(nil, "OVERLAY")
PatAFKPanelTop.PlayerNameText:SetPoint("LEFT", PatAFKPanelTop, "LEFT", 25, 15)
PatAFKPanelTop.PlayerNameText:SetFont(C.media.font, 28, "OUTLINE")
PatAFKPanelTop.PlayerNameText:SetText(PName)
PatAFKPanelTop.PlayerNameText:SetTextColor(color.r, color.g, color.b)

PatAFKPanelTop.GuildText = PatAFKPanelTop:CreateFontString(nil, "OVERLAY")
PatAFKPanelTop.GuildText:SetPoint("LEFT", PatAFKPanelTop, "LEFT", 25, -3)
PatAFKPanelTop.GuildText:SetFont(C.media.font, 15, "OUTLINE")
PatAFKPanelTop.GuildText:SetText("|cff00AAFF" .. PGuild .. "|r")

PatAFKPanelTop.PlayerInfoText = PatAFKPanelTop:CreateFontString(nil, "OVERLAY")
PatAFKPanelTop.PlayerInfoText:SetPoint("LEFT", PatAFKPanelTop, "LEFT", 25, -20)
PatAFKPanelTop.PlayerInfoText:SetFont(C.media.font, 15, "OUTLINE")
PatAFKPanelTop.PlayerInfoText:SetText(LEVEL .. " " .. PLevel .. " " .. PFaction .. " " .. PClass)

local interval = 0
PatAFKPanelTop:SetScript("OnUpdate", function(self, elapsed)
	interval = interval - elapsed
	if(interval <= 0) then
		PatAFKPanelTop.ClockText:SetText(format("%s", date("%I|cff00AAFF:|r%M|cff00AAFF:|r%S%p")))
		PatAFKPanelTop.DateText:SetText(format("%s", date("|cff00AAFF%a|r %b/%d")))
		interval = 0.5
	end
end)

local OnEvent = function(self, event, unit)
	if(event == "PLAYER_FLAGS_CHANGED") then
		if(unit == "player") then
			if(UnitIsAFK(unit)) then
				PatAFKPanel:Show()
				PatAFKPanelTop:Show()
				Minimap:Hide()
			else
				PatAFKPanel:Hide()
				PatAFKPanelTop:Hide()
				Minimap:Show()
			end
		end
	end
end

PatAFKPanel:RegisterEvent("PLAYER_ENTERING_WORLD")
PatAFKPanel:RegisterEvent("PLAYER_LEAVING_WORLD")
PatAFKPanel:RegisterEvent("PLAYER_FLAGS_CHANGED")
PatAFKPanel:SetScript("OnEvent", OnEvent)

local texts = P.AFK_LIST
local interval = #texts

local PatAFKScrollFrame = CreateFrame("ScrollingMessageFrame", "PatAFKScrollFrame", PatAFKPanel)
PatAFKScrollFrame:SetSize(PatAFKPanel:GetWidth(), PatAFKPanel:GetHeight())
PatAFKScrollFrame:SetPoint("CENTER", PatAFKPanel, "CENTER", 0, 60)
PatAFKScrollFrame:SetFont(C.media.font, 20, "OUTLINE")
PatAFKScrollFrame:SetShadowColor(0, 0, 0, 0)
PatAFKScrollFrame:SetFading(false)
PatAFKScrollFrame:SetFadeDuration(0)
PatAFKScrollFrame:SetTimeVisible(1)
PatAFKScrollFrame:SetMaxLines(1)
PatAFKScrollFrame:SetSpacing(2)
PatAFKScrollFrame:SetScript("OnUpdate", function(self, time)
	interval = interval - (time / 30)
	for index, name in pairs(P.AFK_LIST) do
		if(interval < index) then
			PatAFKScrollFrame:AddMessage(P.AFK_LIST[index], 1, 1, 1)
			tremove(texts, index)
		end
	end

	if(interval < 0) then
		self:SetScript("OnUpdate", nil)
	end
end)

PatAFKPanel:SetScript("OnShow", function(self)
	UIFrameFadeIn(UIParent, 0.5, 1, 0)
end)

PatAFKPanel:SetScript("OnHide", function(self)
	UIFrameFadeOut(UIParent, 0.5, 0, 1)
end)
