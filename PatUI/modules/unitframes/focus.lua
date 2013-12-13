local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local self = _G["TukuiFocus"]
local font = C.media.pixelfont
local fsize = C.media.pfontsize

------------------------------------------------------------------------
-- Kill things
------------------------------------------------------------------------

self.shadow:Kill()
self.Debuffs:Kill()
self.Castbar.Icon:Kill()
self.Castbar.button:Kill()

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")

self:SetBackdrop(nil)
self:SetBackdropColor(0, 0, 0)

------------------------------------------------------------------------
--	Setup Focus Frame
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
self.Power.colorClass = true
self.Power.colorReaction = true

self.Power.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Power.value:Point("LEFT", self.Health, "LEFT", 2, -4)
self.Power.value:SetShadowOffset(0, 0)


self.Castbar:SetSize(240, 16)
self.Castbar:ClearAllPoints()
self.Castbar:Point("TOP", self.Power, "BOTTOM", 0, -7)
self.Castbar:CreateBackdrop("Transparent")
self.Castbar.bg:Kill()
self.Castbar:ThickBorder()

self.Castbar.Time = P.SetFontString( self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 1)

self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 1)
