local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames	
local Noop = function() end

--[[local font = C.media.pixelfont
local fsize = C.media.pfontsize
local self = _G["TukuiPet"]

self.panel:Kill()
self.shadow:Kill()
self.Power:Kill()

self:SetBackdrop(nil)
self:SetBackdropColor(0, 0, 0)

------------------------------------------------------------------------
-- Setup Pet Frames Here
------------------------------------------------------------------------

self:SetSize(110, 26)

self.Health:SetHeight(23)
self.Health:SetFrameLevel(5)
self.Health:CreateBorder()

self.Health.bg:SetTexture(C.media.normTex)
self.Health.bg:SetVertexColor(.6, .2, .2)

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
self.Name:SetShadowOffset(0, 0)
self.Name:Point("CENTER", self.Health, "CENTER", 0, 0)

self.Castbar:ClearAllPoints()

self.Castbar.Time:ClearAllPoints()

self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("CENTER", self.Castbar, "CENTER", 0, 0)
]]--

local function CreateUnits()
	local Pet = UnitFrames.Units.Pet

	Pet:SetHeight(23)
	Pet:SetWidth(110)
	
	Pet:ClearAllPoints()
	Pet:SetPoint("BOTTOM", PatBar1, "TOP", 0, 90)
	Pet:SetBackdrop(nil)
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

local function Pet(self)
	local Health = self.Health
	local Name = self.Name
	local Panel = self.Panel
	local Power = self.Power
	local RaidIcon = self.RaidTargetIndicator
	local PBar = T.Panels.PetActionBar
	
	Panel:Hide()
	Power:SetHeight(0)
	
	Health:SetHeight(23)
	Health:SetFrameLevel(5)
	Health:CreateShadow()
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:SetColorTexture(.1, .1, .1)
	
	Health.colorClass = false
	Health.colorReaction = false
	
	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:Point("CENTER", Health, "CENTER", 0, 0)
end
hooksecurefunc(UnitFrames, "Pet", Pet)