local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local self = _G["TukuiPlayer"]
local font = C.media.pixelfont
local fsize = C.media.pfontsize

P.Player = 227

self.panel:Kill()
self.shadow:Kill()
self.FlashInfo:Kill()


TukuiStatueBar:Kill()
------------------------------------------------------------------------
-- Setup Player Frames
------------------------------------------------------------------------

self:Size(P.Player, 30)

self.Health:SetHeight(30)
self.Health:CreateBorder()
self.Health:SetFrameLevel(4)
self.Health.bg:SetVertexColor(.25, .1, .1)
self.Health.bg:SetTexture(C["media"].blank)

self.Power:ClearAllPoints()
self.Power:Point("TOP", self.Health, "BOTTOM", 0, 4)
self.Power:SetHeight(8)
self.Power:SetWidth(190)
self.Power:CreateBorder()
self.Power:SetFrameLevel(10)
self.Power.colorTapping = true
self.Power.colorPower = true

self.Health.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Health.value:Point("TOPLEFT", self.Health, "TOPLEFT", 2, 0)

self.Power.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Power.value:Point("TOPRIGHT", self.Health, "TOPRIGHT", -2, 0)

-- Castbar
self.Castbar:ClearAllPoints()
self.Castbar:CreateBorder()
self.Castbar:Size((TukuiBar1:GetWidth()- 6), 25)
self.Castbar:Point("BOTTOM", TukuiBar1, "TOP", 0, 6)

self.Castbar.Time = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)

self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)

-- experience bar on player via mouseover for player currently leveling a character
if P.level ~= MAX_PLAYER_LEVEL then
    self.Experience:Width(5)
	self.Experience:Height(140)
	self.Experience:ClearAllPoints()
	self.Experience:Point("RIGHT", TukuiMinimap, "LEFT", -5, 0)
	self.Experience:SetOrientation("Vertical")
	self.Experience.Rested:SetOrientation("Vertical")
	self.Experience:SetFrameLevel(10)
	self.Experience:SetAlpha(1)
	self.Experience:HookScript("OnLeave", function(self) self:SetAlpha(1) end)
	
	local xpBG = CreateFrame("Frame", nil,self.Experience)
	xpBG:SetTemplate("Transparent")
	xpBG:SetWidth(self.Experience:GetWidth())
	xpBG:SetHeight(self.Experience:GetHeight())
	xpBG:Point("TOPLEFT", self.Experience, "TOPLEFT", -2, 2)
	xpBG:Point("BOTTOMRIGHT", self.Experience, "BOTTOMRIGHT", 2, -2)
	xpBG:SetFrameLevel(self.Experience:GetFrameLevel() - 1)
	xpBG:SetFrameStrata("BACKGROUND")
	xpBG:ThickBorder()
	
	self.Resting:SetTexture(nil)
end

-- reputation bar for max level character
if P.level == MAX_PLAYER_LEVEL then
    self.Reputation:SetOrientation("Vertical")
	self.Reputation:Width(5)
	self.Reputation:Height(140)
	self.Reputation:ClearAllPoints()
	self.Reputation:Point("RIGHT", TukuiMinimap, "LEFT", -5, 0)
	self.Reputation:SetFrameLevel(10)
	self.Reputation:SetOrientation("Vertical")
	self.Reputation:SetAlpha(1)
	self.Reputation:HookScript("OnLeave", function(self) self:SetAlpha(1) end)
	self.Reputation:SetParent(TukuiMinimap)
	
	local repBG = CreateFrame("Frame", nil, self.Reputation)
	repBG:SetTemplate("Transparent")
	repBG:SetWidth(self.Reputation:GetWidth())
	repBG:SetHeight(self.Reputation:GetHeight())
	repBG:Point("TOPLEFT", self.Reputation, "TOPLEFT", -2, 2)
	repBG:Point("BOTTOMRIGHT", self.Reputation, "BOTTOMRIGHT", 2, -2)
	repBG:SetFrameLevel(self.Reputation:GetFrameLevel() - 1)
	repBG:SetFrameStrata("BACKGROUND")
	repBG:ThickBorder()
end

local PVP = self.Health:CreateTexture(nil, "OVERLAY")
PVP:SetHeight(32)
PVP:SetWidth(32)
PVP:SetPoint("CENTER", self.Health, "CENTER", 0, -7)
self.PvP = PVP

self:EnableElement("PvP")
