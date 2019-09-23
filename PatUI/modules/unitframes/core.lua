local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T["UnitFrames"]
local Noop = function() end

local basePostCreateAura = UnitFrames.PostCreateAura
local basePostUpdateHealth = UnitFrames.PostUpdateHealth

function UnitFrames:PostCreateAura(button)
	basePostCreateAura(self, button)
	
	if C["PatUI"]["ThickBorders"] == true then
		local bg = CreateFrame("Frame", nil, button)
		bg:SetFrameLevel(button:GetFrameLevel() - 1)
		bg:SetFrameStrata(button:GetFrameStrata())
		bg:Size(1, 1)
		bg:Point("TOPLEFT", button, -1.5, 1.5)
		bg:Point("BOTTOMRIGHT", button, 1.5, -1.5)
		bg:PatUI("Transparent")
		bg:CreateShadow()		
		
		button.Shadow:Kill()
	end
end

-- Credits Aftermathh
-- WoW Globals
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitIsConnected = UnitIsConnected
local UnitIsDead = UnitIsDead
local UnitIsGhost = UnitIsGhost
local UnitIsTapDenied = UnitIsTapDenied

function UnitFrames:PostUpdateHealth(unit, min, max)	
	basePostUpdateHealth(self, unit, min, max)
	
	if (not self.Value) then
		return
	end
	
	if (not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) or UnitIsTapDenied(unit)) then
		if (not UnitIsConnected(unit)) then
			self:SetStatusBarColor(0.25, 0.25, 0.25)
			self.Background:SetColorTexture(.25, .1, .1)
		elseif (UnitIsDeadOrGhost(unit)) then
			self:SetStatusBarColor(0.25, 0.25, 0.25)
			self.Background:SetColorTexture(.25, .1, .1)
		elseif UnitIsTapDenied(unit) then
			self:SetStatusBarColor(0.25, 0.25, 0.25)
			self.Background:SetColorTexture(.25, .1, .1)
		end
	else
		self:SetStatusBarColor(.15, .15, .15)
		self.Background:SetColorTexture(.25, .1, .1)
	end
end