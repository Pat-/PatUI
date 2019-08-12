local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local Auras = T["Auras"]
local Minimap = T["Maps"]["Minimap"]
local ObjectiveTracker = T["Miscellaneous"]["ObjectiveTracker"]

local baseEnable = Minimap.Enable
local baseCreateHeaders = Auras.CreateHeaders
local baseSetDefaultPosition = ObjectiveTracker.SetDefaultPosition

function Minimap:Enable()
	-- First call the base function
	baseEnable(self)

	-- Then my stuff
	local MinimapDataText = Panels.MinimapDataText
	local Mail = MiniMapMailFrame
	
	Mail:ClearAllPoints()
	Mail:Point("TOPRIGHT", 0, 0)
	
	Minimap.Backdrop.Shadow:Kill() 
	
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

	Buffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT",  -149, -4)
	Debuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -149, -115)
end

function ObjectiveTracker:SetDefaultPosition()
	-- First call the base function
	baseSetDefaultPosition(self)
	
	-- Then my stuff
	TukuiObjectiveTracker:ClearAllPoints()
	TukuiObjectiveTracker:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 30, -180)
end