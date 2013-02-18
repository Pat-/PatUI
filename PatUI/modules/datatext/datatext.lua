local P, C, L, G = unpack(Tukui)

--our own datatext position function because we made our custom panel
local DataTextPosition = function(f, t, o)
	local points = { Datatext1, Datatext2, Datatext3, Datatext4, Datatext5 }
		
	if o >= 1 and o <= 5 then
		t:ClearAllPoints()
		t:SetParent(points[o])
		t:SetPoint("TOPLEFT")
		t:SetPoint("BOTTOMRIGHT", 0, 1)
	else
		-- hide everything that we don't use and enabled by default on tukui
		f:Hide()
		t:Hide()
	end
end

-- Tukui DataText List
local datatext = {
	"Guild",
	"Friends",
	"Gold",
	"FPS",
	"System",
	"Bags",
	"Gold",
	"Time",
	"Durability",
	"Heal",
	"Damage",
	"Power",
	"Haste",
	"Crit",
	"Avoidance",
	"Armor",
	"Currency",
	"Hit",
	"Mastery",
	"MicroMenu",
	"Regen",
	"Talent",
	"CallToArms",
}

-- Overwrite & Update Show/Hide/Position of all Datatext
for _, data in pairs(datatext) do
	local t = "TukuiStat"
	local frame = _G[t..data]
	local text = _G[t..data.."Text"]

	if frame and frame.Option then
		DataTextPosition(frame, text, frame.Option)
		text:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
	end
end

if C.datatext.friends > 0 then
	TukuiStatFriendsText:SetShadowOffset(0, 0)
end