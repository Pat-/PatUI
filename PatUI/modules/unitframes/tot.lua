local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local font = C.media.pixelfont
local fsize = C.media.pfontsize
local self = _G["TukuiTargetTarget"]

self.panel:Kill()
self.shadow:Kill()

self:SetBackdrop(nil)
self:SetBackdropColor(0, 0, 0)

------------------------------------------------------------------------
-- Setup Target of Target Frames Here
------------------------------------------------------------------------

self:SetSize(110, 26)

self.Health:SetHeight(23)
self.Health:SetFrameLevel(5)
self.Health:CreateBorder()

self.Health.bg:SetTexture(C.media.normTex)
self.Health.bg:SetVertexColor(.6, .2, .2)

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
self.Name:SetShadowOffset(0, 0)
self.Name:Point("CENTER", self.Health, "CENTER", 0, 0)
