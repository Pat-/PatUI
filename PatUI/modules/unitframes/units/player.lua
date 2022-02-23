local T, C, L = Tukui:unpack()

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local UnitFrames = T["UnitFrames"]
local Noop = function() end
local Class = select(2, UnitClass("player"))

local basePlayer = UnitFrames.Player

function UnitFrames:Player()
	-- Call the base function first
	basePlayer(self)
	
	-- Then my stuff
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Portrait = self.Portrait
	local CombatFeedbackText = self.CombatFeedbackText
	local RaidIcon = self.RaidTargetIndicator
	local Combat = self.CombatIndicator 
	local MasterLooter = self.MasterLooterIndicator 
	local Leader = self.LeaderIndicator 
	local ComboPointsBar = self.ComboPointsBar
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local RestingIndicator = self.RestingIndicator

	----------------------------------------------------
	----- Health
	----------------------------------------------------
	
	Health:SetHeight(15)
	Health:SetFrameStrata("MEDIUM")
	Health:SetFrameLevel(5)
	
	Health:PatUI()
	Health.Backdrop:SetBackdropBorderColor(0, 0, 0)
	Health.Backdrop:SetOutside()
	Health.Backdrop:SetFrameStrata("BACKGROUND")

	Health:CreateThinShadow()
	Health.Shadow:SetOutside(Health.Backdrop, 6, 6)
	
	Health.Value:ClearAllPoints()
	Health.Value:SetPoint("LEFT", Health, "LEFT", 4, 1)
	
	Health:SetStatusBarColor(.21, .2, .18)
	Health.Background:SetColorTexture(.38, .40, .40)
	
	Health.colorClass = false
	Health.colorReaction = false

	----------------------------------------------------
	----- Power
	----------------------------------------------------
	
	Power:SetSize(258.5, 3)
	Power:ClearAllPoints()
	Power:SetPoint("CENTER", UIParent, "CENTER", -0.5, -169.5)
	Power:SetFrameLevel(Health:GetFrameLevel())
	Power:SetFrameStrata("MEDIUM")
	Power:CreateBackdrop()

	Power.Backdrop:SetOutside()
	
	Power.Value:ClearAllPoints()
	Power.Background.multiplier = 0.6

	----------------------------------------------------
	----- Castbar
	----------------------------------------------------

	Castbar:ClearAllPoints()
	Castbar:SetSize(258.5, 3)
	Castbar:SetPoint("TOP", TukuiActionBar1, "BOTTOM", 0, 0)
	Castbar:CreateBackdrop()
	Castbar.Backdrop:SetOutside()

	Castbar.Shadow:Kill()

	Castbar:SetFrameStrata("MEDIUM")
	Castbar:SetFrameLevel(10)

	local BG = CreateFrame("Frame", nil, Castbar)
	BG:SetPoint("CENTER", TukuiActionBar1, "CENTER", 0, -3.5)
	BG:CreateBackdrop()
	BG:SetHeight(TukuiActionBar1:GetHeight() + 7)
	BG:SetWidth(TukuiActionBar1:GetWidth())
	BG.Backdrop:SetBackdropColor(0.28, 0.28, 0.28)
	BG:SetFrameStrata("BACKGROUND")

	local ShadowFrame = CreateFrame("Frame", nil, TukuiActionBar1)
	ShadowFrame:SetPoint("TOPLEFT", TukuiActionBar1)
	ShadowFrame:SetPoint("BOTTOMRIGHT", TukuiActionBar1)
	Castbar:SetScript('OnHide', function() ShadowFrame:SetPoint("BOTTOMRIGHT", TukuiActionBar1) end)
	Castbar:SetScript('OnShow', function() ShadowFrame:SetPoint("BOTTOMRIGHT", BG) end)
	ShadowFrame:CreateShadow()
	
	Castbar.Time:ClearAllPoints()
	Castbar.Text:ClearAllPoints()

	----------------------------------------------------
	----- Combo Points
	----------------------------------------------------
	
	if (Class == "ROGUE" or Class == "DRUID") then
		
		ComboPointsBar:ClearAllPoints()
		ComboPointsBar:SetSize(131, 2)
		ComboPointsBar:SetFrameLevel(5)
		ComboPointsBar:SetAlpha(1)

		ComboPointsBar:PatUI()
		ComboPointsBar.Backdrop:SetBackdropBorderColor(0, 0, 0)
		ComboPointsBar.Backdrop:SetOutside()
		ComboPointsBar.Backdrop:SetFrameStrata("BACKGROUND")
		
		ComboPointsBar:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 8, 4)
		
		for i = 1, 6 do
		ComboPointsBar[i]:ClearAllPoints()
		ComboPointsBar[i]:SetHeight(2)
		local SizeFor5 = ceil(131 / 5)
		local SizeFor6 = ceil(131 / 6)

			if i == 1 then
				ComboPointsBar[i]:SetPoint("LEFT", ComboPointsBar, "LEFT", 0, 0)
				ComboPointsBar[i]:SetWidth(SizeFor6 - 2)

				ComboPointsBar[i].Size6Points = SizeFor6 - 2
				ComboPointsBar[i].Size5Points = SizeFor5
			else
				ComboPointsBar[i]:SetPoint("LEFT", ComboPointsBar[i-1], "RIGHT", 1, 0)
				ComboPointsBar[i]:SetWidth(SizeFor6 - 1.5)

				ComboPointsBar[i].Size6Points = SizeFor6 - 1.5
				ComboPointsBar[i].Size5Points = SizeFor5 - 1.5
			end
		end
	end

	----------------------------------------------------
	----- Misc
	----------------------------------------------------

	Panel:Hide()

	Combat:ClearAllPoints()
	Combat:SetPoint("CENTER", Health, "CENTER", 0, 0)
	
	CombatFeedbackText:ClearAllPoints()

	RestingIndicator:ClearAllPoints()
end