local P, C, L = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local font = C.media.pixelfont
local fsize = C.media.pfontsize
local self = _G["TukuiTargetTarget"]

if P.lowversion then
	P.ToT = 182
else
	P.ToT = 130
end

self.panel:Kill()
self.shadow:Kill()

------------------------------------------------------------------------
-- Setup Target of Target Frames Here
------------------------------------------------------------------------

self:Size(P.ToT, 18)

self.Health:CreateBorder()
self.Health.bg:SetVertexColor(.25, .1, .1)
self.Health.bg:SetTexture(C["media"].blank)

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")