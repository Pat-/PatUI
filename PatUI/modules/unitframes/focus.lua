local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local self = _G["TukuiFocus"]
local font = C.media.pixelfont
local fsize = C.media.pfontsize

P.Focus = 116

------------------------------------------------------------------------
-- Kill things
------------------------------------------------------------------------

self.shadow:Kill()
self.Debuffs:Kill()
self.Castbar.Icon:Kill()
self.Castbar.button:Kill()

------------------------------------------------------------------------
--	Setup Focus Frame
------------------------------------------------------------------------

self:Size(P.Focus, 30)

self.Health:SetHeight(30)
self.Health:CreateBorder()
self.Health:SetFrameLevel(4)
self.Health.bg:SetVertexColor(.25, .1, .1)
self.Health.bg:SetTexture(C["media"].blank)

self.Power:ClearAllPoints()
self.Power:Point("TOP", self.Health, "BOTTOM", 0, 4)
self.Power:SetHeight(8)
self.Power:SetWidth(78)
self.Power:CreateBorder()
self.Power:SetFrameLevel(6)
self.Power.colorTapping = true
self.Power.colorPower = true

self.Health.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Health.value:Point("TOPLEFT", self.Health, "TOPLEFT", 2, 0)

self.Power.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Power.value:Point("TOPRIGHT", self.Health, "TOPRIGHT", -2, 0)

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
self.Name:SetShadowOffset(0, 0)

self.Castbar:ClearAllPoints()
self.Castbar:SetHeight(P.Scale(35))
self.Castbar:SetWidth(P.Scale(490))
self.Castbar:SetPoint("TOP", UIParent, "TOP", 0, -190)
self.Castbar:CreateBackdrop("Transparent")
self.Castbar.bg:Kill()

self.Castbar.Time = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)

self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)
