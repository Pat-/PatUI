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
self.Health:SetBorder(false, true)
self.Health:SetStatusBarColor( 0.1, 0.1, 0.1, .7)
self.Health.bg:SetVertexColor( 0.2, 0.2, 0.2, 1 )

self.Health.bg:SetTexture(.2, .2, .2)
self.Health.bg:ClearAllPoints()
self.Health.bg:SetPoint"LEFT"
self.Health.bg:SetPoint"RIGHT"
self.Health.bg:SetPoint"TOP"
self.Health.bg:SetPoint"BOTTOM"
self.Health.bg:SetPoint("LEFT", self.Health:GetStatusBarTexture(), "RIGHT")

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
self.Name:SetShadowOffset(0, 0)
self.Name:Point("CENTER", self.Health, "CENTER", 0, 0)

local power = CreateFrame("StatusBar", nil, self)
power:SetSize(110, 2)
power:SetFrameStrata("LOW")
power:Point("TOP", self.Health, "BOTTOM", 0, -3)
power:SetBorder(false, true)
power:SetStatusBarTexture(C.media.normTex)

local powerBG = power:CreateTexture(nil, "BORDER")
powerBG:SetAllPoints(power)
powerBG:SetTexture(C.media.normTex)
powerBG.multiplier = 0.1
powerBG:SetVertexColor(.12, .12, .12, .7)

power.colorTapping = true
power.colorClass = true
power.colorReaction = true
powerBG.multiplier = 0.1

self.Power = power
self.Power.bg = powerBG

self:EnableElement("Power")
