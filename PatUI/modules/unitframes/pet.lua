local P, C, L, G = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local font = C.media.pixelfont
local fsize = C.media.pfontsize
local self = _G["TukuiPet"]

P.Pet = 130

self.panel:Kill()
self.shadow:Kill()
self.Power:Kill()

------------------------------------------------------------------------
-- Setup Pet Frames Here
------------------------------------------------------------------------

self:Size(P.Pet, 18)

self.Health:Height(18)
self.Health:CreateBorder()
self.Health.bg:SetVertexColor(.25, .1, .1)
self.Health.bg:SetTexture(C["media"].blank)

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")

self.Castbar:ClearAllPoints()
self.Castbar:SetAllPoints(self.Health)

self.Castbar.Time = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)

self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)