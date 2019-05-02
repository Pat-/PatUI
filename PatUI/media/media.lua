local T, C, L = Tukui:unpack()

if not C["Medias"] then C["Medias"] = {} end

local TukuiMedia = T["Media"]
local UnitFrames = T["UnitFrames"]
local baseNameplates = UnitFrames.Nameplates

-- Adding my own Pixelfont to Tukui 
local PatUI = CreateFont("PatUI")
PatUI:SetFont("Interface\\AddOns\\PatUI\\media\\fonts\\pixelfont.ttf", 10, "MONOCHROMEOUTLINE")
TukuiMedia:RegisterFont("PatUI", "PatUI")


-- Just going to be setting fonts here until I find every font that needs to be corrected
function UnitFrames:Nameplates()
	
	baseNameplates(self)

	local PatUI = [=[Interface\AddOns\PatUI\media\fonts\pixelfont.ttf]=]
	
	local Name = self.Name
	local Castbar = self.Castbar
	
	Name:SetFont(PatUI, 10, "MONOCHROMEOUTLINE")
	
	Castbar.Text:SetFont(PatUI, 10, "MONOCHROMEOUTLINE")
end	