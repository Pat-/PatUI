local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local self = _G["TukuiTarget"]
local font = C.media.pixelfont
local fsize = C.media.pfontsize

P.Target = 227

self.panel:Kill()
self.shadow:Kill()
self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")

------------------------------------------------------------------------
-- Setup Target Frames
------------------------------------------------------------------------

self:Size(P.Target + 4, 25)

self.Health:SetHeight(25)
self.Health:CreateBorder()
self.Health:SetFrameLevel(4)
self.Health.bg:SetVertexColor(.25, .1, .1)
self.Health.bg:SetTexture(C["media"].blank)

self.Power:ClearAllPoints()
self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", -6, 2)
self.Power:SetHeight(6)
self.Power:SetWidth(130)
self.Power:CreateBorder()
self.Power:SetFrameLevel(10)
self.Power.colorTapping = true
self.Power.colorPower = true

self.Health.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Health.value:Point("TOPLEFT", self.Health, "TOPLEFT", 2, 0)

self.Power.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Power.value:Point("TOPRIGHT", self.Health, "TOPRIGHT", -2, 0)

-- setup castbar
self.Castbar:ClearAllPoints()
self.Castbar:Size(250, 25)
if C.actionbar.style == 1 then
	self.Castbar:Point("CENTER", UIParent, "CENTER", 0, -150)
else
	self.Castbar:Point("CENTER", UIParent, "CENTER", 0, -50)
end
self.Castbar:SetFrameLevel(4)
self.Castbar:CreateBackdrop("Transparent")
self.Castbar.bg:Kill()

self.Castbar.Time = P.SetFontString(self.Castbar, font, C.media.pfontsize, "MONOCHROMEOUTLINE")
self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)

self.Castbar.Text = P.SetFontString(self.Castbar, font, C.media.pfontsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)

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
end
hooksecurefunc(P, "PostCreateAura", PostCreateAura)

-- edited position, size, space, etc of buffs
self.Buffs:SetHeight(23.3)
self.Buffs:SetWidth(226)
self.Buffs.size = 23.3
self.Buffs.num = 21
self.Buffs.spacing = 3
self.Buffs.initialAnchor = 'TOPLEFT'
self.Buffs["growth-y"] = "UP"
self.Buffs["growth-x"] = "RIGHT"
self.Buffs:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", -2, 5)
self.Buffs.PostCreateIcon = P.PostCreateAura
self.Buffs.PostUpdateIcon = P.PostUpdateAura

-- edited position, size, space, etc of buffs
self.Debuffs:SetHeight(23.5)
self.Debuffs:SetWidth(225)
self.Debuffs.size = 23.5
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