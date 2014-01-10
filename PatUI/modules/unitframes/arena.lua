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
	self:SetBackdrop(nil)
	self:SetBackdropColor(0, 0, 0)
	self.shadow:Kill()
	
	self:Size(215, 23)
	
	self.Health:Height(23)
	self.Health:SetFrameLevel(9)
	self.Health:CreateBorder()

	self.Health.bg:SetTexture(C.media.normTex)
	self.Health.bg:SetVertexColor(.6, .2, .2)

	self.Power:Size(215, 2)
	self.Power:ClearAllPoints()
	self.Power:Point("TOP", self.Health, "BOTTOM", 0, -7)
	self.Power:CreateBorder()
	self.Power:SetFrameLevel(10)
	
	self.Power.bg:SetVertexColor(.12, .12, .12, .1)
	self.Power.bg:SetTexture(C.media.normTex)

	self.Power.value:ClearAllPoints()
	self.Power.value:Point("LEFT", self.Health, "LEFT", 2, -4)
	self.Power.value:SetShadowOffset(0,0)
	self.Power.value:SetFont(font, fsize, "MONOCHROMEOUTLINE")
			
	self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	self.Name:Point("CENTER", self.Health, "CENTER", 0, -5)
	self.Name:SetShadowOffset(0, 0)

	self.Health.value:ClearAllPoints()
	self.Health.value:Point("RIGHT", self.Health, "RIGHT", -2, -4)
	self.Health.value:SetShadowOffset(0, 0)
	self.Health.value:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	
	self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	self.Name:SetShadowOffset(0, 0)
	self.Name:SetPoint("TOP", self.Health, "TOP", 0, 0)
	
	self.Health.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
	self.Health.value:Point("RIGHT", self.Health, "RIGHT", -4, -5)

	self.Power.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
	self.Power.value:Point("LEFT", self.Health, "LEFT", 4, -5)
	
	self.Castbar:ClearAllPoints()
	self.Castbar:SetSize(215, 16)
	self.Castbar:Point("TOPRIGHT", self.Power, "BOTTOMRIGHT", 0, -3)
	
	self.Castbar:CreateBackdrop("Transparent")
	self.Castbar:ThickBorder()
	self.Castbar.bg:Kill()
	self.Castbar.button:Kill()
	
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