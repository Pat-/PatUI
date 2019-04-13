local T, C, L = Tukui:unpack()

local Panels = T["Panels"]
local Auras = T["Auras"]
local Minimap = T["Maps"]["Minimap"]
local ObjectiveTracker = T["Miscellaneous"]["ObjectiveTracker"]

local function Enable(self)
	local MinimapDataText = Panels.MinimapDataText
	local Mail = MiniMapMailFrame
	
	Mail:ClearAllPoints()
	Mail:Point("TOPRIGHT", 0, 0)
	
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

	Buffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT",  -149, -4)
	Debuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -149, -115)
end
hooksecurefunc(Auras, "CreateHeaders", CreateHeaders)

local function SetDefaultPosition()
	ObjectiveTrackerFrame:ClearAllPoints()
	ObjectiveTrackerFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 54, -140)
end
hooksecurefunc(ObjectiveTracker, "SetDefaultPosition", SetDefaultPosition)

-- Resizing Larger World Map like in ElvUI
local function SetWorldMap()
	WorldMapFrame:SetScale(0.9)
	WorldMapFrame.ScrollContainer.Child:SetScale(0.8)
end

-- Remove the blackout frames around WorldMapFrame
WorldMapFrame.BlackoutFrame.Blackout:SetTexture()
WorldMapFrame.BlackoutFrame:EnableMouse(false)

-- reanchor WorldMapFrame (Credits Elvz)
local function SynchronizeDisplayState()
	WorldMapFrame:ClearAllPoints()
	WorldMapFrame:Point("CENTER", UIParent)
end
hooksecurefunc(WorldMapFrame, "SynchronizeDisplayState", SynchronizeDisplayState)

-- resize WorldMapFrame (Credits Elvz)
local function UpdateMaximizedSize()
	local width, height = WorldMapFrame:GetSize()
	local magicNumber = (1 - 0.8) * 100
	WorldMapFrame:Size((width * 0.8) - (magicNumber + 2), (height * 0.8) - 2)
end
hooksecurefunc(WorldMapFrame, "UpdateMaximizedSize", UpdateMaximizedSize)