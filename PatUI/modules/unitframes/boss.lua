local P, C, L, G = unpack(Tukui)

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local font = C.media.pixelfont
local fsize = C.media.pfontsize

------------------------------------------------------------------------
-- Setup Boss Frames
------------------------------------------------------------------------

for i = 1, MAX_BOSS_FRAMES do
	local self = _G["TukuiBoss"..i]
	self:SetBackdrop(nil)
	self:SetBackdropColor(0, 0, 0)
	self.shadow:Kill()
	
	self:Size(215, 23)
	
	self.Health:Height(23)
	self.Health:SetFrameLevel(9)
	self.Health:SetBorder(false, true)
	
	self.Health.bg:SetTexture(C.media.normTex)
	self.Health:SetStatusBarColor(.1, .1, .1, .7)
	self.Health.bg:SetVertexColor(.6, .2, .2, 1)
	
	self.Health.bg:ClearAllPoints()
	self.Health.bg:SetPoint("LEFT")
	self.Health.bg:SetPoint("RIGHT")
	self.Health.bg:SetPoint("TOP")
	self.Health.bg:SetPoint("BOTTOM")
	self.Health.bg:SetPoint("LEFT", self.Health:GetStatusBarTexture(), "RIGHT")

	self.Power:Size(215, 2)
	self.Power:ClearAllPoints()
	self.Power:Point("TOP", self.Health, "BOTTOM", 0, -3)
	self.Power:SetBorder(false, true)
	self.Power:SetFrameStrata("Low")
	self.Power.bg:SetVertexColor(.12, .12, .12, .7)

	self.Power.value:ClearAllPoints()
	self.Power.value:Point("LEFT", self.Health, "LEFT", 4, -5)
	self.Power.value:SetShadowOffset(0,0)
	self.Power.value:SetFont(font, fsize, "MONOCHROMEOUTLINE")
			
	self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	self.Name:Point("CENTER", self.Health, "CENTER", 0, -5)
	self.Name:SetShadowOffset(0, 0)

	self.Health.value:ClearAllPoints()
	self.Health.value:Point("RIGHT", self.Health, "RIGHT", -4, -5)
	self.Health.value:SetShadowOffset(0, 0)
	self.Health.value:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	
	self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	self.Name:SetShadowOffset(0, 0)
	
	self.Health.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
	self.Health.value:Point("TOPLEFT", self.Health, "TOPLEFT", 2, 0)

	self.Power.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
	self.Power.value:Point("TOPRIGHT", self.Health, "TOPRIGHT", -2, 0)
	
	self.Castbar:ClearAllPoints()
	self.Castbar:SetSize(215, 23)
	self.Castbar:Point("TOPRIGHT", self.Power, "BOTTOMRIGHT", 0, -3)
	self.Castbar:SetBorder(false, true)
	
	self.Castbar.bg:Kill()
	self.Castbar.button:Kill()
	
	self.Castbar.bg = self.Castbar:CreateTexture(nil, "BORDER")
	self.Castbar.bg:SetAllPoints(self.Castbar)
	self.Castbar.bg:SetTexture(C.media.normTex)
	self.Castbar.bg:SetVertexColor(0, 0, 0, .7)
	
	self.Castbar.Time = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
	self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)

	self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
	self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)
	
	self.Buffs:SetAlpha(0)
	self.Debuffs:SetAlpha(0)
	
	if i == 1 then
		_G["TukuiBoss"..i]:SetPoint("RIGHT", UIParent, "RIGHT", -100, 0)
	else
		_G["TukuiBoss"..i]:SetPoint("BOTTOM", "TukuiBoss"..i - 1, "TOP", 0, 35)             
	end
end