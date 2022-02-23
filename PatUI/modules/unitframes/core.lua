local T, C, L = Tukui:unpack()

local UnitFrames = T["UnitFrames"]

local baseCreateUnits = UnitFrames.CreateUnits
local basePostCreateAura = UnitFrames.PostCreateAura

function UnitFrames:CreateUnits()
	-- Call the base function first
	baseCreateUnits(self)
	
	-- Then my stuff
	local Player = UnitFrames.Units.Player
	local Target = UnitFrames.Units.Target
	local ToT = UnitFrames.Units.TargetOfTarget
	local Pet = UnitFrames.Units.Pet
	local Focus = UnitFrames.Units.Focus
	local FocusTarget = UnitFrames.Units.FocusTarget
	local Raid = UnitFrames.Headers.Raid
	local Boss = UnitFrames.Units.Boss
	local Arena = UnitFrames.Units.Arena

	----------------------------------------------------
	----- Clearing All anchor points
	----------------------------------------------------

	Player:ClearAllPoints()
	Target:ClearAllPoints()
	ToT:ClearAllPoints()
	Pet:ClearAllPoints()
	Focus:ClearAllPoints()
	FocusTarget:ClearAllPoints()
	Raid:ClearAllPoints()

	for i = 1, 5 do
		Boss[i]:ClearAllPoints()
		Boss[i].Backdrop.Shadow:Kill()

		if (i == 1) then
			Boss[i]:SetPoint("RIGHT", T.PetHider, "RIGHT", -100, 0)
		else
			Boss[i]:SetPoint("BOTTOM", Boss[i-1], "TOP", 0, 34)         
		end
		
		Boss[i]:SetSize(212, 16)
	end

	for i = 1, 5 do
		Arena[i]:ClearAllPoints()
		Arena[i].Backdrop.Shadow:Kill()

		if (i == 1) then
			Arena[i]:SetPoint("RIGHT", T.PetHider, "RIGHT", -100, 0)
		else
			Arena[i]:SetPoint("BOTTOM", Arena[i-1], "TOP", 0, 34)         
		end
		
		Arena[i]:SetSize(212, 16)
	end

	----------------------------------------------------
	----- Reanchoring frames
	----------------------------------------------------

	Player:SetPoint("BOTTOMRIGHT", TukuiActionBar1, "TOPLEFT", -60, 51)
	Target:SetPoint("BOTTOMLEFT", TukuiActionBar1, "TOPRIGHT", 60, 51)
	ToT:SetPoint("LEFT", Target, "RIGHT", 10, 0)
	Pet:SetPoint("TOPRIGHT", Player, "BOTTOMRIGHT", -8, -4)
	Focus:SetPoint("BOTTOM", Player, "TOP", -80, 100)
	Raid:SetPoint("TOP", TukuiActionBar1, "BOTTOM", 0, -40)

	----------------------------------------------------
	----- Resizing frames
	----------------------------------------------------

	Player:SetHeight(15)
	Player:SetWidth(212)
	Player.Shadow:Kill()

	Target:SetHeight(15)
	Target:SetWidth(212)
	Target.Shadow:Kill()

	ToT:SetHeight(15)
	ToT:SetWidth(80)
	ToT.Shadow:Kill()

	Pet:SetHeight(2)
	Pet:SetWidth(131)
	Pet.Shadow:Kill()

	Focus:SetHeight(15)
	Focus:SetWidth(212)
	Focus.Backdrop.Shadow:Kill()
end

function UnitFrames:PostCreateAura(button)
	basePostCreateAura(self, button)

	local PatUI = [=[Interface\AddOns\PatUI\media\fonts\pixelfont.ttf]=]

	button.Remaining:SetFont(PatUI, 10, "MONOCHROMEOUTLINE")
	button.Remaining:ClearAllPoints()

	button:PatUI(nil, "Single")

	button.Shadow:Kill()
end