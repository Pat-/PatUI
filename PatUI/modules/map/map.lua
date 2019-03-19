local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local Auras = T["Auras"]
local Minimap = T.Maps.Minimap

local function Enable(self)
	local MinimapDataText = Panels.MinimapDataText
	
	Minimap:ClearAllPoints()
	Minimap:Point("TOPRIGHT", UIParent, "TOPRIGHT", -4, -4)
	Minimap:CreateShadow()

	local Backdrop = self.Backdrop
	MinimapDataText:Hide()
	
	Backdrop:ClearAllPoints()
	Backdrop:Point("TOPLEFT", self, "TOPLEFT", -1, 1)
	Backdrop:Point("BOTTOMRIGHT", self, "BOTTOMRIGHT", 1, -1)
end 
hooksecurefunc(Minimap, "Enable", Enable)

local function CreateHeaders()
	local Headers = Auras.Headers
	local Buffs = Headers[1]
	local Debuffs = Headers[2]
	
	Buffs:ClearAllPoints()
	Debuffs:ClearAllPoints()

	Buffs:SetAttribute("wrapAfter", 17)
	Buffs:SetAttribute("xOffset", -33)
	Buffs:SetAttribute("wrapYOffset", -36)

	Buffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT",  -153, -4)
	Debuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -153, -118)
end
hooksecurefunc(Auras, "CreateHeaders", CreateHeaders)