local T, C, L, G = unpack(Tukui)

local raidscale = 1

T.RaidFrameAttributes = function()
	return
	"TukuiRaid",
	nil,
	"solo,raid,party",
	"oUF-initialConfigFunction", [[
		local header = self:GetParent()
		self:SetWidth(header:GetAttribute("initial-width"))
		self:SetHeight(header:GetAttribute("initial-height"))
	]],
	"initial-width", 65,
	"initial-height", 34,
	"showParty", true,
	"showRaid", true,
	"showPlayer", true,
	"showSolo", false,
	"xoffset", T.Scale(3),
	"yOffset", T.Scale(3),
	"point", "LEFT",
	"groupFilter", "1,2,3,4,5,6,7,8",
	"groupingOrder", "1,2,3,4,5,6,7,8",
	"groupBy", "GROUP",
	"maxColumns", 8,
	"unitsPerColumn", 5,
	"columnSpacing", T.Scale(3),
	"columnAnchorPoint", "BOTTOM"
end

T.PostUpdateRaidUnit = function(self)
	self.panel:Kill()
	self:SetBackdropColor(0.0, 0.0, 0.0, 0.0)
	
	self.Health:ClearAllPoints()
	self.Health:SetAllPoints(self)
	self.Health:SetBorder(false, true)
	self.Health:SetFrameStrata("LOW")
	self.Health:SetOrientation'HORIZONTAL'
	
	self.Health.bg:ClearAllPoints()
	self.Health.bg:SetPoint("LEFT")
	self.Health.bg:SetPoint("RIGHT")
	self.Health.bg:SetPoint("TOP")
	self.Health.bg:SetPoint("BOTTOM")
	self.Health.bg:SetPoint("LEFT", self.Health:GetStatusBarTexture(), "RIGHT")

	self.Health.colorDisconnected = false
	self.Health.colorClass = false
	self.Health:SetStatusBarColor(0.12, 0.12, 0.12, .7)
	self.Health.value:Point("TOP", self.Health, 0, 0)
	self.Health.value:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
	self.Health.value:SetShadowOffset(0, 0)

	if C.unitframes.unicolor == true then
		self.Health.colorDisconnected = false
		self.Health.colorClass = false
		self.Health:SetStatusBarColor(0.05, 0.05, 0.05, .7)
		self.Health.bg:SetVertexColor(.6, .2, .2, 1)
		self.Health.bg:SetTexture(C.media.normTex)
	else
		self.Health.bg:SetVertexColor(0.05, 0.05, 0.05)
		self.Health.bg:SetTexture(0.05, 0.05, 0.05)
		self.Health.colorDisconnected = true
		self.Health.colorClass = true
		self.Health.colorReaction = true
	end

	if C.unitframes.unicolor == true then
		self:HookScript("OnEnter", function(self)
			if(not UnitIsConnected(self.unit) or UnitIsDead(self.unit) or UnitIsGhost(self.unit)) then return end
			local hover = RAID_CLASS_COLORS[select(2, UnitClass(self.unit))]
			if(not hover) then return end
			self.Health:SetStatusBarColor(hover.r, hover.g, hover.b, .7)
		end)

		self:HookScript("OnLeave", function(self)
			if(not UnitIsConnected(self.unit) or UnitIsDead(self.unit) or UnitIsGhost(self.unit)) then return end
			self.Health:SetStatusBarColor(0.05, 0.05, 0.05, .7)
		end)
	end
	
	self.Power:ClearAllPoints()
	self.Power:SetPoint("BOTTOM", self.Health, "BOTTOM", 0, 1)
	self.Power:SetHeight(1)
	self.Power:SetWidth(65)
	self.Power:SetFrameLevel(self.Health:GetFrameLevel() + 2)
	self.Power:SetFrameStrata("MEDIUM")
	self.Power:SetBorder(false, true)
	
	self.Name:SetParent(self.Health)
	self.Name:ClearAllPoints()
	self.Name:SetPoint("BOTTOM", 0, 6)
	self.Name:SetShadowOffset(0, 0)
	self.Name:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
	self.Name:SetAlpha(1)

	if C.unitframes.raidunitdebuffwatch == true then
		self.RaidDebuffs:Height(21 * C["unitframes"]["gridscale"])
		self.RaidDebuffs:Width(21 * C["unitframes"]["gridscale"])
		self.RaidDebuffs:Point("CENTER", self.Health, 2, 1)

		self.RaidDebuffs.count:ClearAllPoints()
		self.RaidDebuffs.count:SetPoint("CENTER", self.Health, -6, 6)
		self.RaidDebuffs.count:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")

		self.RaidDebuffs.time:ClearAllPoints()
		self.RaidDebuffs.time:SetPoint("CENTER", self.Health, 2, 0)
		self.RaidDebuffs.time:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
	end

	local LFDRole = self.Health:CreateTexture(nil, "OVERLAY")
	LFDRole:Height(15*raidscale)
	LFDRole:Width(15*raidscale)
	LFDRole:Point("TOPLEFT", 1, -1)
	LFDRole.Override = T.RoleIconUpdate
	self:RegisterEvent("UNIT_CONNECTION", T.RoleIconUpdate)
	self.LFDRole = LFDRole

	local Resurrect = CreateFrame("Frame", nil, self.Health)
	Resurrect:SetFrameLevel(self.Health:GetFrameLevel() + 1)
	Resurrect:Size(20)
	Resurrect:SetPoint("CENTER")

	local ResurrectIcon = Resurrect:CreateTexture(nil, "OVERLAY")
	ResurrectIcon:SetAllPoints()
	ResurrectIcon:SetDrawLayer("OVERLAY", 7)
	self.ResurrectIcon = ResurrectIcon
end

local TukuiRaidPosition = CreateFrame("Frame")
TukuiRaidPosition:RegisterEvent("PLAYER_LOGIN")
TukuiRaidPosition:SetScript("OnEvent", function(self, event)
	local raid = G.UnitFrames.RaidUnits
	
	raid:ClearAllPoints()
	raid:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPLEFT", 0, 25)
	
	if C.unitframes.showraidpets == true then
	local pets = G.UnitFrames.RaidPets
		pets:ClearAllPoints()
	end
end)

-- Just because it looks better this way moving target castbar when in healing layout.
TukuiTarget.Castbar:ClearAllPoints()
TukuiTarget.Castbar:Point("TOP", TukuiTarget.Power, "BOTTOM", 0, -3)
