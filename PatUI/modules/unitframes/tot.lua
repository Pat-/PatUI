local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T.UnitFrames
local Noop = function() end

--[[local font = C.media.pixelfont
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
self.Health:CreateBorder()

self.Health.bg:SetTexture(C.media.normTex)
self.Health.bg:SetVertexColor(.6, .2, .2)

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
self.Name:SetShadowOffset(0, 0)
self.Name:Point("CENTER", self.Health, "CENTER", 0, 0)
]]--

local function CreateUnits()
	local ToT = UnitFrames.Units.TargetOfTarget

	ToT:SetHeight(23)
	ToT:SetWidth(110)
	
	ToT:ClearAllPoints()
	ToT:SetPoint("BOTTOM", Bar1, "TOP", 0, 50)
	ToT:SetBackdrop(nil)
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

local function TargetOfTarget(self)
	local Panel = self.Panel
	local Health = self.Health
	local Name = self.Name
	local Panel = self.Panel
	local RaidIcon = self.RaidTargetIndicator
	
	Panel:Hide()
	
	Health:SetHeight(23)
	Health:SetFrameLevel(5)
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:SetColorTexture(.1, .1, .1)
	
	Health.colorClass = false
	Health.colorReaction = false
	
	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:Point("CENTER", self.Health, "CENTER", 0, 0)
end
hooksecurefunc(UnitFrames, "TargetOfTarget", TargetOfTarget)