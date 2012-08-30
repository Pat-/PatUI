local P, C, L, G = unpack(Tukui)
------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local font = C.media.pixelfont
local fsize = C.media.pfontsize

------------------------------------------------------------------------
-- Setup Arena Frames
------------------------------------------------------------------------

for i = 1, 5 do
	local self = _G["TukuiArena"..i]
	
	self:Size(180, 30)
	
	self.Health:SetHeight(30)
	self.Health:CreateBorder()
	self.Health:SetFrameLevel(4)
	self.Health.bg:SetVertexColor(.25, .1, .1)
	self.Health.bg:SetTexture(C["media"].blank)

	self.Power:ClearAllPoints()
	self.Power:Point("TOP", self.Health, "BOTTOM", 0, 4)
	self.Power:SetHeight(8)
	self.Power:SetWidth(143)
	self.Power:CreateBorder()
	self.Power:SetFrameLevel(10)
	self.Power.colorTapping = true
	self.Power.colorPower = true
	
	self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	self.Name:SetShadowOffset(0, 0)
	
	self.Health.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
	self.Health.value:Point("TOPLEFT", self.Health, "TOPLEFT", 2, 0)

	self.Power.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
	self.Power.value:Point("TOPRIGHT", self.Health, "TOPRIGHT", -2, 0)
	
	self.Castbar.Time = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
	self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)

	self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
	self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)
	
	self.Debuffs:SetAlpha(0)
	
	if i == 1 then
		_G["TukuiArena"..i]:SetPoint("RIGHT", UIParent, "RIGHT", -100, 0)
	else
		_G["TukuiArena"..i]:SetPoint("BOTTOM", "TukuiArena"..i - 1, "TOP", 0, 35)             
	end
end