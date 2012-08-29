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

------------------------------------------------------------------------
-- Setup Pet Frames Here
------------------------------------------------------------------------

self:Size(P.Pet, 18)

self.Health:Height(18)
self.Health:CreateBorder()

self.Power:Kill()

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")