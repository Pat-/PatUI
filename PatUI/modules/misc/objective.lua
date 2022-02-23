--[[local T, C, L = Tukui:unpack()

local ObjectiveTracker = T["Miscellaneous"]["ObjectiveTracker"]
local Movers = T["Movers"]

local Class = select(2, UnitClass("player"))
local ClassColor = T.Colors.class[Class]

local ObjectiveTrackerFrameHeaderMenuMinimizeButton = ObjectiveTrackerFrame.HeaderMenu.MinimizeButton

local baseSetDefaultPosition = ObjectiveTracker.SetDefaultPosition
local baseSkinTracker = ObjectiveTracker.Skin
local baseEnable = ObjectiveTracker.Enable
local baseUpdateProgressBar = ObjectiveTracker.UpdateProgressBar
local baseAddHooks = ObjectiveTracker.AddHooks

function ObjectiveTracker:SetDefaultPosition()
	-- First call the base function
	baseSetDefaultPosition(self)

	local Data = TukuiData[T.MyRealm][T.MyName]
	
	-- Then my stuff
	TukuiObjectiveTracker:ClearAllPoints()

	local ObjectiveMover = CreateFrame("Frame", "PatUIObjectiveTracker", UIParent)
	ObjectiveMover:SetSize(130, 20)
	ObjectiveMover:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -50.5, -170.5)

	ObjectiveTrackerFrame:ClearAllPoints()
	ObjectiveTrackerFrame:SetPoint("TOP", ObjectiveMover)
    ObjectiveTrackerFrame:SetHeight(T.ScreenHeight - 520)
	ObjectiveTrackerFrame.IsUserPlaced = function() return true end

	Movers:RegisterFrame(ObjectiveMover, "PatUI Objectives Tracker")

	if Data and Data.Move and Data.Move.PatUIObjectiveTracker then
		ObjectiveMover:ClearAllPoints()
		ObjectiveMover:SetPoint(unpack(Data.Move.PatUIObjectiveTracker))
	end
end

local function PatUIObjectiveTrackerSkin()
	local Frame = ObjectiveTrackerFrame.MODULES

	if (Frame) then
		for i = 1, #Frame do

			local Modules = Frame[i]
			if (Modules) then
				local Header = Modules.Header

				local Background = Modules.Header.Background
				Background:SetAtlas(nil)

				local Text = Modules.Header.Text
				Text:SetFont(C.Medias.Font, 16)
				Text:SetDrawLayer("OVERLAY", 7)
				Text:SetParent(Header)

				if not (Modules.IsSkinned) then
					local HeaderPanel = CreateFrame("Frame", nil, Header)
					HeaderPanel:SetFrameLevel(Header:GetFrameLevel() - 1)
					HeaderPanel:SetFrameStrata("BACKGROUND")
					HeaderPanel:SetOutside(Header, 1, 1)

					local HeaderBar = CreateFrame("StatusBar", nil, HeaderPanel)
					HeaderBar:SetSize(214, 2)
					HeaderBar:SetPoint("BOTTOMLEFT", HeaderPanel, -13, 0)
					HeaderBar:SetStatusBarTexture(T.GetTexture(C.Textures.QuestProgressTexture))
					HeaderBar:SetStatusBarColor(unpack(ClassColor))
					HeaderBar:PatUI(nil, "Single")
					HeaderBar.Backdrop:SetOutside()
					HeaderBar.Backdrop:SetBackdropBorderColor(0, 0, 0)

					HeaderBar:CreateThinShadow()
					HeaderBar.Shadow:SetOutside(HeaderBar.Backdrop, 5, 5)
					
					local Minimize = Header.MinimizeButton
					Minimize.SetCollapsed = function() return end
					Minimize:StripTextures()
					Minimize:ClearAllPoints()
					Minimize:SetAllPoints(HeaderBar)

					Modules.IsSkinned = true
				end
			end
		end
	end
end

function ObjectiveTracker:Skin()
	PatUIObjectiveTrackerSkin()
end

function ObjectiveTracker:Enable()
	baseEnable(self)

	ObjectiveTrackerFrameHeaderMenuMinimizeButton.Backdrop.Shadow:Kill()	

	ObjectiveTrackerFrameHeaderMenuMinimizeButton:PatUI(nil, "Single")
	ObjectiveTrackerFrameHeaderMenuMinimizeButton.Backdrop:SetFrameLevel(ObjectiveTrackerFrameHeaderMenuMinimizeButton:GetFrameLevel() + 1)
	ObjectiveTrackerFrameHeaderMenuMinimizeButton:CreateThinShadow()
	ObjectiveTrackerFrameHeaderMenuMinimizeButton.Shadow:SetOutside(ObjectiveTrackerFrameHeaderMenuMinimizeButton.Backdrop, 5, 5) 
end

function ObjectiveTracker:UpdateProgressBar(_, line)
	baseUpdateProgressBar(self, _, line)

	local Progress = line.ProgressBar
	local Bar = Progress.Bar

	if (Bar) then
		local Icon = Bar.Icon
		local R, G, B = unpack(T.Colors.class[T.MyClass])

		Bar.Backdrop:Kill()

		Bar:PatUI("Transparent", "Single")
		Bar.Backdrop:SetBackdropColor(R * .15, G * .15, B * .15)
		Bar.Backdrop:SetBackdropBorderColor(0, 0, 0)
		
		Bar.Backdrop:SetFrameLevel(Bar:GetFrameLevel() - 1)
		Bar.Backdrop:SetFrameStrata("BACKGROUND")
		Bar.Backdrop:SetOutside()

		Bar:CreateThinShadow()
		Bar.Shadow:SetOutside(Bar.Backdrop, 5, 5)

		if (Icon and Bar.NewBorder) then
			Icon:SetPoint("RIGHT", Bar, 27, 0)

			Bar.NewBorder.Backdrop:Kill()

			Bar.NewBorder:PatUI(nil, "Single")
			Bar.NewBorder.Backdrop:SetBackdropBorderColor(0, 0, 0)
			Bar.NewBorder:CreateThinShadow()
			Bar.NewBorder.Shadow:SetOutside(Bar.NewBorder.Backdrop, 5, 5)
		end
	end
end
]]--