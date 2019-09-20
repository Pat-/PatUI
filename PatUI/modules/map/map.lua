local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local Minimap = T["Maps"]["Minimap"]

local baseEnable = Minimap.Enable
local baseAddZoneAndCoords = Minimap.AddZoneAndCoords

function Minimap:Enable()
	-- First call the base function
	baseEnable(self)

	-- Then my stuff
	local MinimapDataText = Panels.MinimapDataText
	local Mail = MiniMapMailFrame
	
	Mail:ClearAllPoints()
	Mail:Point("TOPRIGHT", 0, 0)
	
	Minimap.Backdrop.Shadow:Kill() 
	
	Minimap:Size(200)
	
	Minimap:ClearAllPoints()
	Minimap:Point("TOPRIGHT", UIParent, "TOPRIGHT", -4, -4)
	Minimap:CreateShadow()
	if C["PatUI"]["ThickBorders"] == true then
		Minimap:PatUI()
	end

	local Backdrop = self.Backdrop
	MinimapDataText:Hide()
	
	Backdrop:ClearAllPoints()
	Backdrop:Point("TOPLEFT", self, "TOPLEFT", -1, 1)
	Backdrop:Point("BOTTOMRIGHT", self, "BOTTOMRIGHT", 1, -1)
end 

function Minimap:AddZoneAndCoords()
	baseAddZoneAndCoords(self)
	
	local MinimapZone = self.MinimapZone
	local MinimapCoords = self.MinimapCoords
	
	MinimapZone:SetWidth(186)
	MinimapZone:ClearAllPoints()
	MinimapZone:Point("TOP", self, 0, -5)
	
	local zonebg = CreateFrame("Frame", nil, MinimapZone)
	zonebg:Size(1, 1)
	zonebg:PatUI()
	zonebg:Point("TOPLEFT", MinimapZone, -1.5, 1.5)
	zonebg:Point("BOTTOMRIGHT", MinimapZone, 1.5, -1.5)
	zonebg:SetFrameLevel(MinimapZone:GetFrameLevel() - 1)
	
	MinimapCoords:ClearAllPoints()
	MinimapCoords:Point("BOTTOMLEFT", self, "BOTTOMLEFT", 5, 5)
	
	local coordsbg = CreateFrame("Frame", nil, MinimapCoords)
	coordsbg:Size(1, 1)
	coordsbg:PatUI()
	coordsbg:Point("TOPLEFT", MinimapCoords, -1.5, 1.5)
	coordsbg:Point("BOTTOMRIGHT", MinimapCoords, 1.5, -1.5)
	coordsbg:SetFrameLevel(MinimapCoords:GetFrameLevel() - 1)
end