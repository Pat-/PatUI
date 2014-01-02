local P, C, L, G = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local font = C.media.pixelfont
local fsize = C.media.pfontsize
local self = _G["TukuiPet"]

self.panel:Kill()
self.shadow:Kill()
self.Power:Kill()

self:SetBackdrop(nil)
self:SetBackdropColor(0, 0, 0)

------------------------------------------------------------------------
-- Setup Pet Frames Here
------------------------------------------------------------------------

self:SetSize(110, 26)

self.Health:SetHeight(23)
self.Health:SetFrameLevel(5)
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

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
self.Name:SetShadowOffset(0, 0)
self.Name:Point("CENTER", self.Health, "CENTER", 0, 0)

self.Castbar:ClearAllPoints()
self.Castbar:AllPoints(self.Health)
self.Castbar:CreateBackdrop("Transparent")
self.Castbar.bg:Kill()

self.Castbar.Time:ClearAllPoints()

self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("CENTER", self.Castbar, "CENTER", 0, 0)
