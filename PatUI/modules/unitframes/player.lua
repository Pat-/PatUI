local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local self = _G["TukuiPlayer"]
local font = C.media.pixelfont
local fsize = C.media.pfontsize

self.panel:Kill()
self.shadow:Kill()
self.FlashInfo:Kill()

self:SetBackdrop(nil)
self:SetBackdropColor(0, 0, 0)

------------------------------------------------------------------------
-- Setup Player Frames
------------------------------------------------------------------------

self:Size(240, 26)

self.Health:SetHeight(23)
self.Health:SetFrameLevel(5)
self.Health:SetFrameStrata("LOW")
self.Health:CreateBorder()

self.Health.bg:SetTexture(C.media.normTex)
self.Health:SetStatusBarColor(.1, .1, .1, .1)
self.Health.bg:SetVertexColor(.6, .2, .2, 1)

self.Health.bg:ClearAllPoints()
self.Health.bg:SetPoint("LEFT")
self.Health.bg:SetPoint("RIGHT")
self.Health.bg:SetPoint("TOP")
self.Health.bg:SetPoint("BOTTOM")
self.Health.bg:SetPoint("LEFT", self.Health:GetStatusBarTexture(), "RIGHT")

self.Health.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Health.value:Point("RIGHT", self.Health, "RIGHT", -4, 0)
self.Health.value:SetShadowOffset(0, 0)

self.Power:ClearAllPoints()
self.Power:Point("TOP", self.Health, "BOTTOM", 0, -7)
self.Power:SetHeight(2)
self.Power:SetWidth(240)
self.Power:CreateBorder()
self.Power:SetFrameLevel(10)

self.Power.bg:SetVertexColor(.12, .12, .12, .1)
self.Power.bg:SetTexture(C.media.normTex)

self.Power.colorClass = true
self.Power.colorReaction = true

self.Power.value = P.SetFontString( self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Power.value:Point("LEFT", self.Health, "LEFT", 4, 0)
self.Power.value:SetShadowOffset(0, 0)

self.Castbar:ClearAllPoints()
self.Castbar:SetSize((TukuiBar1:GetWidth() - 4), 19)
self.Castbar:SetPoint("BOTTOMRIGHT", TukuiBar1, "TOPRIGHT", -2, 5)
self.Castbar:CreateBackdrop("Transparent")
self.Castbar.bg:Kill()
self.Castbar:ThickBorder()

self.Castbar.Time = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 1)

self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 1)

-- experience bar on player via mouseover for player currently leveling a character
if P.level ~= MAX_PLAYER_LEVEL then
   	self.Experience:ClearAllPoints()
	self.Experience:SetStatusBarColor( 0, 0.4, 1, 0.8 )

	self.Experience:Size(TukuiTabsLeftBackground:GetWidth() - 4, 2)
	self.Experience:Point("BOTTOM", TukuiTabsLeftBackground, "TOP", 0, 5)
	self.Experience:SetFrameLevel(3)
	self.Experience:SetAlpha(1)
	self.Experience:CreateBorder()

	self.Experience:SetBackdropColor(.12, .12, .12, .9)

	self.Experience:HookScript("OnLeave", function(self) self:SetAlpha(1) end)

	self.Resting:SetTexture(nil)
end

-- reputation bar for max level character
if P.level == MAX_PLAYER_LEVEL then
   self.Reputation:ClearAllPoints()

	self.Reputation:Size(TukuiTabsLeftBackground:GetWidth() - 4, 2)
	self.Reputation:Point("BOTTOM", TukuiTabsLeftBackground, "TOP", 0, 5)
	self.Reputation:SetFrameLevel(3)
	self.Reputation:SetAlpha(1)
	self.Reputation:CreateBorder()

	self.Reputation:SetBackdropColor(.12, .12, .12, .9)

	self.Reputation:SetScript("OnLeave", function(self) self:SetAlpha(1) end)
end
