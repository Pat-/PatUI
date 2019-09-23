local T, C, L = Tukui:unpack()

if C["PatUI"]["pInterrupt"] == false then return end

local name = select(2, UnitName("player"))
local pAnnounce = CreateFrame("Frame")
pAnnounce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
pAnnounce:SetScript("OnEvent", function(self, _, ...)
	local inGroup, inRaid = IsInGroup(), IsInRaid()
	if not inGroup then return end

	local _, Event, _, SourceGUID, _, _, _, _, DestName, _, _, _, SpellName = CombatLogGetCurrentEventInfo()
	if not (Event == "SPELL_INTERRUPT" and (SourceGUID == UnitGUID("player") or SourceGUID == UnitGUID("pet"))) then return end
	SendChatMessage("Interrupted " .. DestName .. "!", "SAY")
end)