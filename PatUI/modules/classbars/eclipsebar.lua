local P, C, L, G = unpack(Tukui)
if P.myclass ~= "DRUID" or C.unitframes.classbar ~= true then return end

local font = C.media.pixelfont
local fsize = C.media.pfontsize

local self = _G["TukuiPlayer"]

self.EclipseBar:ClearAllPoints()
self.EclipseBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, -1)
self.EclipseBar:Size(130, 3)
self.EclipseBar:CreateBorder()

self.EclipseBar.LunarBar:SetSize(self.EclipseBar:GetWidth(), self.EclipseBar:GetHeight())
self.EclipseBar.SolarBar:SetSize(self.EclipseBar:GetWidth(), self.EclipseBar:GetHeight())

self.EclipseBar.Text:ClearAllPoints()
self.EclipseBar.Text:SetPoint("CENTER", self.Health, 0, 0)
self.EclipseBar.Text:SetFont(font, fsize, "MONOCHROMEOUTLINE")
self.EclipseBar.Text:SetShadowOffset(0, 0)