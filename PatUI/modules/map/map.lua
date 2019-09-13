local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local Auras = T["Auras"]
local Minimap = T["Maps"]["Minimap"]
local ObjectiveTracker = T["Miscellaneous"]["ObjectiveTracker"]

local baseEnable = Minimap.Enable
local baseCreateHeaders = Auras.CreateHeaders

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

	local Backdrop = self.Backdrop
	MinimapDataText:Hide()
	
	Backdrop:ClearAllPoints()
	Backdrop:Point("TOPLEFT", self, "TOPLEFT", -1, 1)
	Backdrop:Point("BOTTOMRIGHT", self, "BOTTOMRIGHT", 1, -1)
end 

function Auras:CreateHeaders()
	-- First call the base function
	baseCreateHeaders(self)
	
	-- Then my stuff
	local Headers = Auras.Headers
	local Buffs = Headers[1]
	local Debuffs = Headers[2]
	
	Buffs:ClearAllPoints()
	Debuffs:ClearAllPoints()

	Buffs:SetAttribute("wrapAfter", 17)
	Buffs:SetAttribute("xOffset", -33)
	Buffs:SetAttribute("wrapYOffset", -36)

	Buffs:SetPoint("RIGHT", Minimap, "TOPLEFT",  -4, -16)
	Debuffs:SetPoint("RIGHT", Minimap, "BOTTOMLEFT", -4, 16)
end