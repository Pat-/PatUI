local P, C, L, G = unpack(Tukui)
if P.myclass ~= "DRUID" or C.unitframes.classbar ~= true then return end

local font = C.media.pixelfont
local fsize = C.media.pfontsize

local self = _G["TukuiPlayer"]

self.EclipseBar:ClearAllPoints()
self.EclipseBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 6)
self.EclipseBar:Size(self:GetWidth(), 6)
self.EclipseBar:CreateBorder()

self.EclipseBar.LunarBar:SetSize(self.EclipseBar:GetWidth(), self.EclipseBar:GetHeight())
self.EclipseBar.SolarBar:SetSize(self.EclipseBar:GetWidth(), self.EclipseBar:GetHeight())

self.EclipseBar.Text:ClearAllPoints()
self.EclipseBar.Text:SetPoint("CENTER", self.Health, 0, 0)
self.EclipseBar.Text:SetFont(font, fsize, "MONOCHROMEOUTLINE")
self.EclipseBar.Text:SetShadowOffset(0, 0)

if C.unitframes.druidmushroombar == true then
	self.WildMushroom:ClearAllPoints()
	self.WildMushroom:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 26)
	self.WildMushroom:Size(self:GetWidth(), 6)
	self.WildMushroom:CreateBorder()

	for i = 1, 3 do
		self.WildMushroom[i]:Size((self:GetWidth() / 3), 6)

		if( i == 1 ) then
			self.WildMushroom[i]:SetPoint("LEFT", self.WildMushroom, "LEFT", 0, 0)
		else
			self.WildMushroom[i]:Point("LEFT", self.WildMushroom[i - 1], "RIGHT", 1, 0)
		end
	end
end