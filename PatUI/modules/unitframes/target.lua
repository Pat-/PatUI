local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local self = _G["TukuiTarget"]
local font = C.media.pixelfont
local fsize = C.media.pfontsize

self.panel:Kill()
self.shadow:Kill()
self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")

self:SetBackdrop(nil)
self:SetBackdropColor(0, 0, 0)

------------------------------------------------------------------------
-- Setup Target Frames
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
self.Health.value:Point("RIGHT", self.Health, "RIGHT", -2, -4)
self.Health.value:SetShadowOffset(0, 0)

self.Power:ClearAllPoints()
self.Power:Point("TOP", self.Health, "BOTTOM", 0, -7)
self.Power:SetHeight(2)
self.Power:SetWidth(240)
self.Power:CreateBorder()
self.Power:SetFrameLevel(10)
self.Power:SetFrameStrata("LOW")

self.Power.bg:SetVertexColor(.12, .12, .12, .1)
self.Power.bg:SetTexture(C.media.normTex)

self.Power.colorTapping = true
self.Power.colorClass = false
self.Power.colorReaction = false

self.Power.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Power.value:Point("LEFT", self.Health, "LEFT", 2, -4)
self.Power.value:SetShadowOffset(0, 0)

self.Castbar:CreateBackdrop("Transparent")
self.Castbar.bg:Kill()
self.Castbar:ThickBorder()

if (IsAddOnLoaded("PatUI_Heal")) then
	self.Castbar:SetSize(240, 16)
	self.Castbar:ClearAllPoints()
	self.Castbar:Point("TOP", self.Power, "BOTTOM", 0, -7)
else
	self.Castbar:SetSize(240, 19)
	self.Castbar:ClearAllPoints()
	self.Castbar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 400)
end

self.Castbar.Time = P.SetFontString( self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 1)

self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 1)

-- Thanks to Tukz and FlyingBoots
-- our update (hook) or the original buff/debuffs button creation)
local function PostCreateAura(self, button)
	-- kill the glow
	button.Glow:Kill()

	-- move icon just 1px inside the black inset (it hide 1px borders)
	button:SetBorder(false, true)
	button.icon:Point("TOPLEFT", 2, -2)
	button.icon:Point("BOTTOMRIGHT", -2, 2)

	-- resize the cooldown tex to fix new icon size
	button.cd:Point("TOPLEFT", button, "TOPLEFT", 0, 0)
	button.cd:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)

	-- change the font
	button.remaining:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	button.remaining:SetShadowOffset(0, 0)
end
hooksecurefunc(P, "PostCreateAura", PostCreateAura)

-- edited position, size, space, etc of buffs
self.Buffs:SetHeight(27)
self.Buffs:SetWidth(260)
self.Buffs.size = 24.5
self.Buffs.num = 9
self.Buffs.spacing = 3
self.Buffs.initialAnchor = 'TOPLEFT'
self.Buffs["growth-y"] = "UP"
self.Buffs["growth-x"] = "RIGHT"
self.Buffs:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", -2, 4)
self.Buffs.PostCreateIcon = P.PostCreateAura
self.Buffs.PostUpdateIcon = P.PostUpdateAura

-- edited position, size, space, etc of buffs
self.Debuffs:SetHeight(29)
self.Debuffs:SetWidth(240)
self.Debuffs.size = 27.5
self.Debuffs.num = 21
self.Debuffs.spacing = 3
self.Debuffs.initialAnchor = 'TOPRIGHT'
self.Debuffs["growth-y"] = "UP"
self.Debuffs["growth-x"] = "LEFT"
self.Debuffs:ClearAllPoints()
self.Debuffs:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, 35)
self.Debuffs.PostCreateIcon = P.PostCreateAura
self.Debuffs.PostUpdateIcon = P.PostUpdateAura

-- because default tukui update regularly the position of buffs/debuffs on this unit
-- we need to disable the position update process
self.Buffs.ClearAllPoints = P.dummy
self.Buffs.SetPoint = P.dummy