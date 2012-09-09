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
	self.Power:Height(1)
	self.Power:SetWidth(P.Scale((ChatBackground:GetWidth()/ 5 ) - 6) - 26)
	self.Power:SetBorder(false, true)
	self.Power:Point("TOP", self.Health, "BOTTOM", 0, 4)
	self.Power:SetStatusBarTexture(C["media"].blank)
	self.Power:SetFrameLevel(15)

	self.Name:SetParent(self.Health)
	self.Name:ClearAllPoints()
	self.Name:SetPoint("BOTTOM", 0, 8)
	self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	
	local LFDRole = self.Health:CreateTexture(nil, "OVERLAY")
	LFDRole:Height(15)
	LFDRole:Width(15)
	LFDRole:Point("TOPLEFT", 1, -1)
	LFDRole.Override = P.RoleIconUpdate
	self:RegisterEvent("UNIT_CONNECTION", P.RoleIconUpdate)
	self.LFDRole = LFDRole
	
	if C.unitframes.raidunitdebuffwatch == true then		
		self.RaidDebuffs:ClearAllPoints()
		self.RaidDebuffs:Height(24)
		self.RaidDebuffs:Width(24)
		self.RaidDebuffs:Point('CENTER', self.Health, 1,0)
		self.RaidDebuffs:SetFrameStrata(self.Health:GetFrameStrata())
		self.RaidDebuffs:SetFrameLevel(self.Health:GetFrameLevel() + 2)
		
		self.RaidDebuffs.icon:SetTexCoord(.1,.9,.1,.9)
		self.RaidDebuffs.icon:Point("TOPLEFT", 2, -2)
		self.RaidDebuffs.icon:Point("BOTTOMRIGHT", -2, 2)
		
		self.RaidDebuffs.count:SetFont(C.media.uffont, 12, "THINOUTLINE")
		self.RaidDebuffs.count:SetPoint('BOTTOMRIGHT', RaidDebuffs, 'BOTTOMRIGHT', 0, 2)
		self.RaidDebuffs.count:SetTextColor(1, .9, 0)
		
		self.RaidDebuffs:FontString('time', C.media.uffont, 12, "THINOUTLINE")
		self.RaidDebuffs.time:SetPoint('CENTER')
		self.RaidDebuffs.time:SetTextColor(1, .9, 0)
		
	end
	
	if C.unitframes.healcomm then
		local mhpb = CreateFrame("StatusBar", "mhpb", self.Health)
		if C.unitframes.gridhealthvertical then
			mhpb:SetOrientation("VERTICAL")
			mhpb:SetPoint("BOTTOM", self.Health:GetStatusBarTexture(), "TOP", 0, 0)
			mhpb:Width(P.Scale((ChatBackground:GetWidth()/ 5) - 5))
			mhpb:Height(30)		
		else
			mhpb:SetPoint("TOPLEFT", self.Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
			mhpb:SetPoint("BOTTOMLEFT", self.Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
			mhpb:Width(self.Health:GetWidth())
		end				
		mhpb:SetStatusBarTexture(normTex)
		mhpb:SetStatusBarColor(0, 1, 0.5, 0.25)

		local ohpb = CreateFrame("StatusBar", "ohpb", self.Health)
		if C.unitframes.gridhealthvertical then
			ohpb:SetOrientation("VERTICAL")
			ohpb:SetPoint("BOTTOM", mhpb:GetStatusBarTexture(), "TOP", 0, 0)
			ohpb:Width(P.Scale((ChatBackground:GetWidth()/ 5) - 5))
			ohpb:Height(30)
		else
			ohpb:SetPoint("TOPLEFT", mhpb:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
			ohpb:SetPoint("BOTTOMLEFT", mhpb:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
			ohpb:Width(6)
		end
		ohpb:SetStatusBarTexture(normTex)
		ohpb:SetStatusBarColor(0, 1, 0, 0.25)
	end
	
	-- highlight
	self:HighlightUnit(218/255, 197/255, 92/255)

end

local RaidPosition = CreateFrame("Frame")
RaidPosition:RegisterEvent("PLAYER_LOGIN")
RaidPosition:SetScript("OnEvent", function(self, event)
	G.UnitFrames.RaidUnits:ClearAllPoints()
	G.UnitFrames.RaidPets:ClearAllPoints()
	G.UnitFrames.RaidUnits:SetPoint("TOP", UIParent, "BOTTOM", 0, 315)
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
	"groupFilter", "1,2,3,4,5",
	"groupingOrder", "1,2,3,4,5",
	"groupBy", "GROUP",
	"maxColumns", 8,
	"unitsPerColumn", 5,
	"columnSpacing", P.Scale(8),
	"columnAnchorPoint", "BOTTOM"
end
