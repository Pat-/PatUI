local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local UnitFrames = T.UnitFrames
local Noop = function() end


--[[local self = _G["TukuiFocus"]
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
self.Health.bg:SetVertexColor(.6, .2, .2)

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
self.Power.colorClass = false
self.Power.colorReaction = false

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
]]--

local function CreateUnits()
	local Focus = UnitFrames.Units.Focus

	Focus:SetHeight(23)
	Focus:SetWidth(240)
	
	Focus:SetPoint("BOTTOM", UIParent, "BOTTOM", -400, 400)
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

local function Focus(self)
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Name = self.Name
	local RaidIcon = self.RaidTargetIndicator
	
	Health:SetHeight(23)
	Health:SetFrameLevel(5)
	Health:SetFrameStrata("LOW")
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:SetColorTexture(.1, .1, .1)
	
	Health.colorTapping = false
	Health.colorDisconnected = false
	Health.colorClass = false
	Health.colorReaction = false

	Health.Value:ClearAllPoints()
	Health.Value:Point("RIGHT", Health, "RIGHT", -2, -4)

	Power:ClearAllPoints()
	Power:Point("TOPRIGHT", Health, "BOTTOMRIGHT", -4, 1)
	Power:SetHeight(3)
	Power:SetWidth(90)
	Power:SetFrameLevel(10)
	Power:CreateBackdrop("Default")
	Power:CreateShadow()

	Power.Value:ClearAllPoints()
	Power.Value:Point("LEFT", Health, "LEFT", 2, -4)
	Power.Value:SetShadowOffset(0, 0)

	Castbar:SetSize(240, 16)
	Castbar:ClearAllPoints()
	Castbar:Point("TOP", Power, "BOTTOM", 0, -7)
	Castbar:CreateBackdrop("Transparent")

	Castbar.Time:ClearAllPoints()
	Castbar.Time:Point("RIGHT", Castbar, "RIGHT", -4, 1)

	Castbar.Text:ClearAllPoints()
	Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 1)
	
end
hooksecurefunc(UnitFrames, "Focus", Focus)