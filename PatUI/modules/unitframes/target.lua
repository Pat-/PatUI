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
self.Health:SetFrameLevel(9)
self.Health:SetFrameStrata("LOW")
self.Health:SetBorder(false, true)

self.Health.bg:SetTexture(C.media.normTex)
self.Health:SetStatusBarColor(0.1, 0.1, 0.1, 0.7)
self.Health.bg:SetVertexColor(.6, .2, .2, 1)

self.Health.bg:ClearAllPoints()
self.Health.bg:SetPoint("LEFT")
self.Health.bg:SetPoint("RIGHT")
self.Health.bg:SetPoint("TOP")
self.Health.bg:SetPoint("BOTTOM")
self.Health.bg:SetPoint("LEFT", self.Health:GetStatusBarTexture(), "RIGHT")

self.Health.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Health.value:Point("RIGHT", self.Health, "RIGHT", -4, -5)
self.Health.value:SetShadowOffset(0, 0)

self.Power:Size(240, 2)
self.Power:ClearAllPoints()
self.Power:SetFrameLevel(1)
self.Power:SetFrameStrata("Background")
self.Power:Point("TOP", self.Health, "BOTTOM", 0, -3)
self.Power:SetBorder(false, true)
self.Power.bg:SetVertexColor(.12, .12, .12, .7)

self.Power.value = P.SetFontString( self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Power.value:Point("LEFT", self.Health, "LEFT", 4, -5)
self.Power.value:SetShadowOffset(0, 0)

self.Castbar:ClearAllPoints()
self.Castbar:SetSize(240, 19)
self.Castbar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 400)
self.Castbar:SetBorder(false, true)
self.Castbar.bg:SetVertexColor( 0.2, 0.2, 0.2, .7)
self.Castbar.bg:SetTexture(.2, .2, .2)

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
	button.icon:Point("TOPLEFT", 0, 0)
	button.icon:Point("BOTTOMRIGHT", 0, 0)

	-- resize the cooldown tex to fix new icon size
	button.cd:Point("TOPLEFT", button, "TOPLEFT", 0, 0)
	button.cd:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)

	-- change the font
	button.remaining:SetFont(font, fsize, "MONOCHROMEOUTLINE")
end
hooksecurefunc(P, "PostCreateAura", PostCreateAura)

-- edited position, size, space, etc of buffs
self.Buffs:SetHeight(24)
self.Buffs:SetWidth(240)
self.Buffs.size = 21
self.Buffs.num = 9
self.Buffs.spacing = 3
self.Buffs.initialAnchor = 'TOPLEFT'
self.Buffs["growth-y"] = "UP"
self.Buffs["growth-x"] = "RIGHT"
self.Buffs:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, 0)
self.Buffs.PostCreateIcon = P.PostCreateAura
self.Buffs.PostUpdateIcon = P.PostUpdateAura

-- edited position, size, space, etc of buffs
self.Debuffs:SetHeight(35)
self.Debuffs:SetWidth(240)
self.Debuffs.size = 26
self.Debuffs.num = 21
self.Debuffs.spacing = 3
self.Debuffs.initialAnchor = 'TOPRIGHT'
self.Debuffs["growth-y"] = "UP"
self.Debuffs["growth-x"] = "LEFT"
self.Debuffs:ClearAllPoints()
self.Debuffs:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 2, 35)
self.Debuffs.PostCreateIcon = P.PostCreateAura
self.Debuffs.PostUpdateIcon = P.PostUpdateAura

-- because default tukui update regularly the position of buffs/debuffs on this unit
-- we need to disable the position update process
self.Buffs.ClearAllPoints = P.dummy
self.Buffs.SetPoint = P.dummy
