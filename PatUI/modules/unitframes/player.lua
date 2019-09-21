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
	local Portrait = self.Portrait
	local CombatFeedbackText = self.CombatFeedbackText
	local Combat = self.CombatIndicator 
	local ComboPointsBar = self.ComboPointsBar
	local Font = T.GetFont(C["UnitFrames"].Font)
	
	Panel:Hide()
	
	Health:Height(23)
	
	Health.Value:Hide()
	local HealthCurrent = Health:CreateFontString(nil, "OVERLAY")
	HealthCurrent:SetParent(Health)
	HealthCurrent:SetPoint("LEFT", Health, "LEFT", 4, 0)
	HealthCurrent:SetFontObject(Font)
	HealthCurrent:SetJustifyH("LEFT")
	self:Tag(HealthCurrent, "[Tukui:GetNameColor][curhp]")
	
	Health:SetStatusBarColor(.15, .15, .15)
	Health.Background:SetColorTexture(.05, .05, .05)
	
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
	Power.Background:Hide()
	
	Power.Value:Hide()
	local PowerCurrent = Power:CreateFontString(nil, "OVERLAY")
	PowerCurrent:SetParent(Health)
	PowerCurrent:SetPoint("RIGHT", Health, "RIGHT", -4, 0)
	PowerCurrent:SetFontObject(Font)
	PowerCurrent:SetJustifyH("RIGHT")
	self:Tag(PowerCurrent, "[powercolor][curpp]")

	Castbar:ClearAllPoints()
	Castbar:SetSize((PatBar1:GetWidth()) - 4, 12)
	Castbar:SetPoint("BOTTOMRIGHT", PatBar1, "TOPRIGHT", -2, 5)
	Castbar:CreateBackdrop("Transparent")
	Castbar.Background:Hide()
	
	Castbar.Time:ClearAllPoints()
	Castbar.Time:Point("RIGHT", Castbar, "RIGHT", -4, 1)

	Castbar.Text:ClearAllPoints()
	Castbar.Text:Point("LEFT", Castbar, "LEFT", 4, 1)
	Castbar.Text:Size(160, 10) -- prevent long cast names (ex: Bloodbathed Frostbrood Vanquisher) from wrapping and going outside of the castbar
	
	Combat:ClearAllPoints()
	Combat:Point("CENTER", Health, "CENTER", 0, 0)
	
	CombatFeedbackText:ClearAllPoints()
	
	if C["UnitFrames"]["Portrait"] == true then
		Portrait:Size(40, 40)
		Portrait:ClearAllPoints()
		Portrait:Point("RIGHT", Health, "LEFT", -8, 9)
	
		Health:ClearAllPoints()
		Health:SetAllPoints(self)
		if C["PatUI"]["ThickBorders"] == true then			
			local portraitbg = CreateFrame("Frame", nil, self)
			portraitbg:SetFrameLevel(Portrait:GetFrameLevel())
			portraitbg:SetFrameStrata(Portrait:GetFrameStrata())
			portraitbg:Size(46, 45)
			portraitbg:Point("CENTER", Portrait, "CENTER", 0, 0)
			portraitbg:PatUI()
			portraitbg:CreateShadow()
		end
	end
	
	if (Class == "ROGUE" or Class == "DRUID") then
		
		ComboPointsBar:ClearAllPoints()
		ComboPointsBar:Size(240, 5)
		ComboPointsBar:SetFrameLevel(15)
		ComboPointsBar:SetAlpha(1)
		ComboPointsBar:SetBackdrop(nil)
		ComboPointsBar:CreateBackdrop("Transparent")
		
		if C["PatUI"]["ThickBorders"] == true then
			ComboPointsBar:SetPoint("BOTTOM", Health, "TOP", 0, 6)
			
			local bg = CreateFrame("Frame", "ComboBG", ComboPointsBar)
			bg:SetFrameLevel(ComboPointsBar:GetFrameLevel() - 1)
			bg:SetFrameStrata(ComboPointsBar:GetFrameStrata())
			bg:Size(1, 1)
			bg:Point("TOPLEFT", ComboPointsBar, -2, 2)
			bg:Point("BOTTOMRIGHT", ComboPointsBar, 2, -2)
			bg:PatUI("Transparent")
			bg:Hide()
		else
			ComboPointsBar:SetPoint("BOTTOM", Health, "TOP", 0, 3)
			ComboPointsBar:CreateShadow()
		end
		
		ComboPointsBar:SetScript("OnShow", function(self)
			ComboBG:Show()
		end)

		ComboPointsBar:SetScript("OnHide", function(self)
			ComboBG:Hide()
		end)
		
		for i = 1, 5 do
		ComboPointsBar[i]:ClearAllPoints()
		ComboPointsBar[i]:CreateBackdrop()
		ComboPointsBar[i]:Height(5)

			if i == 1 then
				ComboPointsBar[i]:Point("LEFT", ComboPointsBar, "LEFT", 0, 0)
				ComboPointsBar[i]:SetWidth(48)
			else
				ComboPointsBar[i]:Point("LEFT", ComboPointsBar[i-1], "RIGHT", 1, 0)
				ComboPointsBar[i]:SetWidth(47)
			end
		end
	end
	
	if C["PatUI"]["ThickBorders"] == true then
		local ufbg = CreateFrame("Frame", nil, self)
		ufbg:SetFrameLevel(Health:GetFrameLevel() - 1)
		ufbg:SetFrameStrata(Health:GetFrameStrata())
		ufbg:Size(1, 1)
		ufbg:Point("TOPLEFT", Health, -2, 2)
		ufbg:Point("BOTTOMRIGHT", Health, 2, -2)
		ufbg:PatUI()
		ufbg:CreateShadow()
		
		local powerbg = CreateFrame("Frame", nil, self)
		powerbg:SetFrameLevel(Health:GetFrameLevel() + 1)
		powerbg:SetFrameStrata(Health:GetFrameStrata())
		powerbg:Size(1, 1)
		powerbg:Point("TOPLEFT", Power, -2, 2)
		powerbg:Point("BOTTOMRIGHT", Power, 2, -2)
		powerbg:PatUI()
		powerbg:CreateShadow()
		
		local castbg = CreateFrame("Frame", nil, Castbar)
		castbg:PatUI("Transparent")
		castbg:Size(1, 1)
		castbg:Point("TOPLEFT", Castbar, -2, 2)
		castbg:Point("BOTTOMRIGHT", Castbar, 2, -2)
		castbg:SetFrameLevel(Castbar:GetFrameLevel() - 1)
		castbg:CreateShadow()
	else
		Health:CreateShadow()
		Power:CreateShadow()
		Castbar:CreateShadow()
	end
end