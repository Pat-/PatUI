local T, C, L = Tukui:unpack()

local Experience = T["Miscellaneous"]["Experience"]
local Reputation = T["Miscellaneous"]["Reputation"]
local Minimap = T["Maps"]["Minimap"]

local font = "Interface\\AddOns\\PatUI\\media\\fonts\\pixelfont.ttf"
local fontsize = 10
local texture = "Interface\\AddOns\\PatUI\\media\\textures\\PatUI.tga"
local MyLevel = UnitLevel("player")
local IsPlayerAtEffectiveMaxLevel = IsPlayerAtEffectiveMaxLevel

local baseExp = Experience.Create

function Experience:Create()
	-- First call the base function
	baseExp(self)
	
	-- then my stuff
	local XPBar = self.XPBar1
	local XPBar2 = self.XPBar2
	local Rested = self.RestedBar1
	local Rested2 = self.RestedBar2

	XPBar2:ClearAllPoints()
	XPBar:SetStatusBarTexture(texture)
	Rested:SetStatusBarTexture(texture)
	Rested:SetFrameLevel(XPBar:GetFrameLevel())

	XPBar:ClearAllPoints()
	XPBar:SetPoint("TOP", Minimap, "BOTTOM", 0, -9)
	XPBar:SetHeight(4)
	XPBar:SetWidth(140)
	XPBar:CreateThinShadow()
	XPBar:PatUI()

	XPBar.Backdrop:SetBackdropBorderColor(0, 0, 0)
	XPBar.Backdrop:SetPoint("TOPLEFT", -1, 1)
	XPBar.Backdrop:SetPoint("BOTTOMRIGHT", 1, -1)

	XPBar.Shadow:SetOutside(XPBar.Backdrop, 6, 6)
end
