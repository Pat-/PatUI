local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T["UnitFrames"]
local Noop = function() end
local Class = select(2, UnitClass("player"))

local baseCreateUnits = UnitFrames.CreateUnits
local basePlayer = UnitFrames.Player

function UnitFrames:CreateUnits()
	-- Call the base function first
	baseCreateUnits(self)
	
	-- Then my stuff
    local Player = UnitFrames.Units.Player

	Player:SetHeight(23)
	Player:SetWidth(240)
	
	Player.Shadow:Kill()
	
	Player:ClearAllPoints()
	if C["PatUI"]["Healer"] == true then
		Player:SetPoint("BOTTOMLEFT", PatBar1, "TOPLEFT", -254, 150)
	else
		Player:SetPoint("BOTTOMLEFT", PatBar1, "TOPLEFT", -160, 50)
	end
end

function UnitFrames:Player()
	-- Call the base function first
	basePlayer(self)
	
	-- Then my stuff
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local CombatFeedbackText = self.CombatFeedbackText
	local Combat = self.CombatIndicator 
	local ComboPointsBar = self.ComboPointsBar
	local Font = T.GetFont(C["UnitFrames"].Font)
		
	Panel:Hide()
	
	Health:SetHeight(23)
	Health:CreateShadow()
	
	Health.Value:Hide()
	local HealthCurrent = Health:CreateFontString(nil, "OVERLAY")
	HealthCurrent:SetParent(Health)
	HealthCurrent:SetPoint("LEFT", Health, "LEFT", 4, 0)
	HealthCurrent:SetFontObject(Font)
	HealthCurrent:SetJustifyH("LEFT")
	self:Tag(HealthCurrent, "[Tukui:GetNameColor][curhp]")
	
	Health:SetStatusBarColor(.2, .2, .2)
	Health.Background:SetColorTexture(.1, .1, .1)
	
	Health.colorTapping = false
	Health.colorDisconnected = false
	Health.colorClass = false
	Health.colorReaction = false
	
	Power:ClearAllPoints()
	Power:Point("TOPRIGHT", Health, "BOTTOMRIGHT", -4, 1)
	Power:SetHeight(3)
	Power:SetWidth(90)
	Power:SetFrameLevel(10)
	Power:CreateBackdrop("Default")
	Power:CreateShadow()
	Power.Background:Hide()
	
	Power.Value:Hide()
	local PowerCurrent = Power:CreateFontString(nil, "OVERLAY")
	PowerCurrent:SetParent(Health)
	PowerCurrent:SetPoint("RIGHT", Health, "RIGHT", -4, 0)
	PowerCurrent:SetFontObject(Font)
	PowerCurrent:SetJustifyH("RIGHT")
	self:Tag(PowerCurrent, "[powercolor][curpp]")

	Castbar:ClearAllPoints()
	Castbar:SetSize((PatBar1:GetWidth()) - 2, 12)
	Castbar:SetPoint("BOTTOMRIGHT", PatBar1, "TOPRIGHT", -1, 3)
	Castbar:CreateBackdrop("Transparent")
	Castbar.Background:Hide()
	Castbar:CreateShadow()
	
	Castbar.Time:ClearAllPoints()
	Castbar.Time:Point("RIGHT", Castbar, "RIGHT", -4, 1)

	Castbar.Text:ClearAllPoints()
	Castbar.Text:Point("LEFT", Castbar, "LEFT", 4, 1)
	Castbar.Text:Size(160, 10) -- prevent long cast names (ex: Bloodbathed Frostbrood Vanquisher) from wrapping and going outside of the castbar
	
	Combat:ClearAllPoints()
	Combat:Point("CENTER", Health, "CENTER", 0, 0)
	
	CombatFeedbackText:ClearAllPoints()
	
	if (Class == "ROGUE" or Class == "DRUID") then
		
		ComboPointsBar:ClearAllPoints()
		ComboPointsBar:Size(240, 5)
		ComboPointsBar:SetFrameLevel(15)
		ComboPointsBar:SetAlpha(1)
		ComboPointsBar:SetBackdrop(nil)
		ComboPointsBar:CreateBackdrop("Transparent")
		ComboPointsBar:CreateShadow()
		
		ComboPointsBar:SetPoint("BOTTOM", Health, "TOP", 0, 3)
		
		for i = 1, 5 do -- classic is capped at 5
		ComboPointsBar[i]:ClearAllPoints()
		ComboPointsBar[i]:CreateBackdrop()
		ComboPointsBar[i]:Height(5)

			if i == 1 then
				ComboPointsBar[i]:Point("LEFT", ComboPointsBar, "LEFT", 0, 0)
				ComboPointsBar[i]:SetWidth(48)
				ComboPointsBar[i].BarSizeForMaxComboIs5 = 48
			else
				ComboPointsBar[i]:Point("LEFT", ComboPointsBar[i-1], "RIGHT", 1, 0)
				ComboPointsBar[i]:SetWidth(47)
				ComboPointsBar[i].BarSizeForMaxComboIs5 = 47
			end
		end
	end
end

local TukuiUnitFrames = T["UnitFrames"]
local baseNameplates = TukuiUnitFrames.Nameplates

function TukuiUnitFrames:Nameplates()
	-- First call the base function
	baseNameplates(self)

	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	
	Health:ClearAllPoints()
	Health:SetAllPoints(self)
	Health:SetHeight(9)
	Health:CreateBackdrop("Transparent")
	Health.Background:Hide()
	Health:CreateShadow()
	
	self:SetHeight(7)
	self.Shadow:Kill()
	
	Castbar:Hide()
	Castbar:SetHeight(0)
	
	Castbar.Icon:ClearAllPoints()
	Castbar.Button:ClearAllPoints()
	Castbar.Button.Shadow:Kill()
	
	Power:Hide()
	Power:SetHeight(0)
end