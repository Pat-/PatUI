local P, C, L, G = unpack(Tukui)

--------------------------------------------------------------
-- Setting up raid frames here
--------------------------------------------------------------

local font = C.media.pixelfont
local fsize = C.media.pfontsize
local raidscale = 1
	
P.PostUpdateRaidUnit = function(self)
	self.panel:Kill()

	self.Health:ClearAllPoints()
	self.Health:SetAllPoints(self)
	self.Health:CreateBorder()
	self.Health:SetStatusBarTexture(C.media.normTex)
	self.Health:SetStatusBarColor(.3, .3, .3, 1)
	
	self.Health.value:Point("CENTER", self.Health, 1, 13)
	self.Health.value:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	self.Health.PostUpdate = P.PostUpdateHealthRaid
	self.Health.bg:SetVertexColor(.25, .1, .1)
	self.Health.value:SetShadowOffset(0, 0)
	self.Health.bg:SetTexture(C["media"].blank)
	
	self.Power:ClearAllPoints()

	self.Name:SetParent(self.Health)
	self.Name:ClearAllPoints()
	self.Name:SetPoint("BOTTOM", 0, 8)
	self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	
	local LFDRole = self.Health:CreateTexture(nil, "OVERLAY")
	LFDRole:Height(15*raidscale)
	LFDRole:Width(15*raidscale)
	LFDRole:Point("TOPLEFT", 1, -1)
	LFDRole.Override = P.RoleIconUpdate
	self:RegisterEvent("UNIT_CONNECTION", P.RoleIconUpdate)
	self.LFDRole = LFDRole
end

local RaidPosition = CreateFrame("Frame")
RaidPosition:RegisterEvent("PLAYER_LOGIN")
RaidPosition:SetScript("OnEvent", function(self, event)
	G.UnitFrames.RaidUnits:ClearAllPoints()
	G.UnitFrames.RaidPets:ClearAllPoints()
	G.UnitFrames.RaidUnits:SetPoint("BOTTOMLEFT", ChatBackground, "TOPLEFT", 2, 18)
end)

P.RaidFrameAttributes = function()
	return
	"TukuiRaid",
	nil,
	"custom [petbattle] hide;show",
	"oUF-initialConfigFunction", [[
		local header = self:GetParent()
		self:SetWidth(header:GetAttribute("initial-width"))
		self:SetHeight(header:GetAttribute("initial-height"))
	]],
	"initial-width", P.Scale((ChatBackground:GetWidth()/ 5) - 5),
	"initial-height", P.Scale(30),
	"showParty", true,
	"showRaid", true,
	"showPlayer", true,
	--"showSolo", true, -- used to test raid frame without a party.
	"xoffset", P.Scale(6),
	"yOffset", P.Scale(-6),
	"point", "LEFT",
	"groupFilter", "1,2,3,4,5,6,7,8",
	"groupingOrder", "1,2,3,4,5,6,7,8",
	"groupBy", "GROUP",
	"maxColumns", 8,
	"unitsPerColumn", 5,
	"columnSpacing", P.Scale(8),
	"columnAnchorPoint", "TOP"
end
