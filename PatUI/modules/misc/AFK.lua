local P, C, L, G = unpack(Tukui) 

------------------------------------------------------------------------
-- Working on own AFK Banner now, using one from NishaUI as base.
------------------------------------------------------------------------

local PName = P.myname
local PLevel = P.level
local PClass = UnitClass("player")
local PRace = P.myrace
local PFaction = P.myfaction
local color = RAID_CLASS_COLORS[P.myclass]
local PGuild
if(IsInGuild()) then
	PGuild = select(1, GetGuildInfo("player"))
else
	PGuild = " "
end

P.AFK_LIST = {
	"You can find a good number of extra AddOns for Tukui/ElvUI at wwww.tukui.org",
	"Did you know, it's easier to post in your native language on www.tukui.org to get support as we have such a large community",
	"You can freely update your Tukui version and external edits like this one will remain working most of the time",
	"tukui.org is a great community and there is always something awesome poping up everyday!",
	"Thanks to Tukz and his hard work Intefaces like ElvUI, AsphyxiaUI and DuffedUI are possible",
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
PatAFKPanelTop.Text:SetText("|cff18AA18PatUI v"..GetAddOnMetadata("PatUI", "Version").."|r")

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
PatAFKPanelTop.GuildText:SetText("|cff00AAFF"..PGuild.."|r")

PatAFKPanelTop.PlayerInfoText = PatAFKPanelTop:CreateFontString(nil, "OVERLAY")
PatAFKPanelTop.PlayerInfoText:SetPoint("LEFT", PatAFKPanelTop, "LEFT", 25, -20)
PatAFKPanelTop.PlayerInfoText:SetFont(C.media.font, 15, "OUTLINE")
PatAFKPanelTop.PlayerInfoText:SetText(LEVEL.." "..PLevel.." "..PFaction.." "..PClass)

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
