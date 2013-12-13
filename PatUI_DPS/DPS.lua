local P, C, L, G = unpack(Tukui)

--------------------------------------------------------------
-- Setting up raid frames here
--------------------------------------------------------------

local font = C.media.pixelfont
local fsize = C.media.pfontsize
local raidscale = 1

P.RaidFrameAttributes = function()
	return
		"TukuiRaid",
		nil,
		"solo,raid,party",
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute("initial-width"))
			self:SetHeight(header:GetAttribute("initial-height"))
		]],
		"initial-width", 70.9,
		"initial-height", 27,
		"showParty", true,
		"showRaid", true,
		"showPlayer", true,
		"showSolo", false,
		"xoffset", P.Scale(6),
		"yOffset", P.Scale(5),
		"point", "LEFT",
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"maxColumns", 8,
		"unitsPerColumn", 5,
		"columnSpacing", P.Scale(6),
		"columnAnchorPoint", "BOTTOM"
end

P.PostUpdateRaidUnit = function(self)
	self.panel:Kill()
	self:SetBackdropColor(0.0, 0.0, 0.0, 0.0)
	
	self.Health:ClearAllPoints()
	self.Health:SetAllPoints(self)
	self.Health:CreateBorder()
	self.Health:SetFrameStrata("LOW")
	self.Health:SetOrientation('HORIZONTAL')
	self.Health:SetStatusBarColor(.1, .1, .1, .1)
	
	self.Health.bg:SetTexture(C.media.normTex)
	self.Health.bg:SetVertexColor(.6, .2, .2, 1)

	self.Health.bg:ClearAllPoints()
	self.Health.bg:SetPoint("LEFT")
	self.Health.bg:SetPoint("RIGHT")
	self.Health.bg:SetPoint("TOP")
	self.Health.bg:SetPoint("BOTTOM")
	self.Health.bg:SetPoint("LEFT", self.Health:GetStatusBarTexture(), "RIGHT")

	self.Health.colorDisconnected = false
	self.Health.colorClass = false
	self.Health.value:Point("TOP", self.Health, 0, 0)
	self.Health.value:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	self.Health.value:SetShadowOffset(0, 0)

	if C.unitframes.unicolor == true then
		self:HookScript("OnEnter", function(self)
			if(not UnitIsConnected(self.unit) or UnitIsDead(self.unit) or UnitIsGhost(self.unit)) then return end
			local hover = RAID_CLASS_COLORS[select(2, UnitClass(self.unit))]
			if(not hover) then return end
			self.Health:SetStatusBarColor(hover.r, hover.g, hover.b, .7)
		end)

		self:HookScript("OnLeave", function(self)
			if(not UnitIsConnected(self.unit) or UnitIsDead(self.unit) or UnitIsGhost(self.unit)) then return end
			self.Health:SetStatusBarColor(0.05, 0.05, 0.05, .1)
		end)
	end

	-- Power.
	self.Power:Kill()-- Dun want it on the DPS layout. 3:
	
	self.Name:SetParent(self.Health)
	self.Name:ClearAllPoints()
	self.Name:SetPoint("BOTTOM", 0, 2)
	self.Name:SetShadowOffset(0, 0)
	self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	self.Name:SetAlpha(1)

	if C.unitframes.raidunitdebuffwatch == true then
		self.RaidDebuffs:Height(21 * C.unitframes.gridscale)
		self.RaidDebuffs:Width(21 * C.unitframes.gridscale)
		self.RaidDebuffs:Point("CENTER", self.Health, 2, 1)

		self.RaidDebuffs.count:ClearAllPoints()
		self.RaidDebuffs.count:SetPoint("CENTER", self.Health, -2, 2)
		self.RaidDebuffs.count:SetFont(font, fsize, "MONOCHROMEOUTLINE")

		self.RaidDebuffs.time:ClearAllPoints()
		self.RaidDebuffs.time:SetPoint("CENTER", self.Health, 0, 0)
		self.RaidDebuffs.time:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	end

	local LFDRole = self.Health:CreateTexture(nil, "OVERLAY")
	LFDRole:Height(15*raidscale)
	LFDRole:Width(15*raidscale)
	LFDRole:Point("TOPLEFT", 1, -1)
	LFDRole.Override = P.RoleIconUpdate
	self:RegisterEvent("UNIT_CONNECTION", P.RoleIconUpdate)
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
	raid:SetPoint("BOTTOMLEFT", TukuiTabsLeftBackground, "TOPLEFT", 2, 16)
	
	if Bar3:IsShown() then
		raid:SetPoint("BOTTOMLEFT", Bar3, "TOPLEFT", -1, 7)
	end
	
	Bar3:HookScript("OnHide", function()
		raid:ClearAllPoints()
		raid:SetPoint("BOTTOMLEFT", TukuiTabsLeftBackground, "TOPLEFT", 2, 16)
	end)
	
	Bar3:HookScript("OnShow", function()
		raid:ClearAllPoints()
		raid:SetPoint("BOTTOMLEFT", Bar3, "TOPLEFT", -1, 7)
	end)
	
	if C.unitframes.showraidpets == true then
	local pets = G.UnitFrames.RaidPets
		pets:ClearAllPoints()
	end
end)
