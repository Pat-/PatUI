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

