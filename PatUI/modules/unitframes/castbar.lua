local T, C, L = Tukui:unpack()

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")

local texture = UIParent:CreateTexture()
texture:SetSize(48, 48)
texture:SetPoint("CENTER")

local targetGUID
local spellIDtoFileID = {}

eventFrame:SetScript("OnEvent", function(self, fevent)
    if fevent == "COMBAT_LOG_EVENT_UNFILTERED" then
        local args = {CombatLogGetCurrentEventInfo()}
        local event = args[2]
        if event == "SPELL_CAST_START" then
            if targetGUID == args[4] then
                local spellID = args[12]
                if not (spellIDtoFileID[spellID]) then
                    spellIDtoFileID[spellID] = GetSpellTexture(spellID)
                end

                texture:SetTexture(spellIDtoFileID[spellID])
            end
        elseif event == "SPELL_CAST_SUCCESS" or event == "SPELL_CAST_FAILED" then
            if targetGUID == args[4] then
                texture:SetTexture(nil)
            end
        elseif event == "UNIT_DIED" then
            if targetGUID == args[8] then
                texture:SetTexture(nil)
            end
        end
    elseif fevent == "PLAYER_TARGET_CHANGED" then
        local guid = UnitGUID("target")
        if not guid or guid ~= targetGUID then
            texture:SetTexture(nil)
        end

        targetGUID = guid
    end
end)