local T, C, L = Tukui:unpack()

if not C["Medias"] then C["Medias"] = {} end

local TukuiMedia = T["Media"]
local UnitFrames = T["UnitFrames"]
local ActionBars = T["ActionBars"]
local baseNameplates = UnitFrames.Nameplates
local baseSkinButton = ActionBars.SkinButton


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

function ActionBars:SkinButton()
	
	baseSkinButton(self)
	
	local Name = self:GetName()
	local macroText = _G[Name.."Name"]
	local Count = _G[Name.."Count"]
	local HotKey = _G[Name.."HotKey"]
	local PatUI = [=[Interface\AddOns\PatUI\media\fonts\pixelfont.ttf]=]
	
	if macroText then
		macroText:SetFont(PatUI, 10, "MONOCHROMEOUTLINE")
		macroText:ClearAllPoints()
		macroText:SetPoint("BOTTOM", 1, 2.5)
	end
	
	Count:SetFont(PatUI, 10, "MONOCHROMEOUTLINE")
	HotKey:SetFont(PatUI, 10, "MONOCHROMEOUTLINE")
end