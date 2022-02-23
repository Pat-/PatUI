local T, C, L = Tukui:unpack()

local Chat = T["Chat"]
local Auras = T["Auras"]
local Minimap = T["Maps"]["Minimap"]

local baseEnbale = Minimap.Enable
local baseCreateHeaders = Auras.CreateHeaders
local baseDataText = Minimap.AddMinimapDataTexts
local baseSkin = Auras.Skin

function Minimap:Enable()
	-- First call the base function
	baseEnbale(self)

	-- Then my stuff
	local Mail = MiniMapMailFrame

	Minimap.Backdrop.Shadow:Kill()

	Mail:ClearAllPoints()
	Mail:SetPoint("TOPRIGHT", 0, 0)
	
	Minimap:ClearAllPoints()
	Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -6, -6)
	Minimap:CreateThinShadow()
	Minimap:PatUI()

	Minimap.Backdrop:SetBackdropBorderColor(0, 0, 0)
	Minimap.Backdrop:SetPoint("TOPLEFT", -1, 1)
	Minimap.Backdrop:SetPoint("BOTTOMRIGHT", 1, -1)

	Minimap.Shadow:SetOutside(Minimap.Backdrop, 6, 6)
end 

function Minimap:AddMinimapDataTexts()
	baseDataText(self)

	local MinimapDataText = T.DataTexts.Panels.Minimap

	MinimapDataText:Hide()
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
	Buffs:SetAttribute("xOffset", -35)
	Buffs:SetAttribute("wrapYOffset", -36)

	Buffs:SetPoint("RIGHT", Minimap, "TOPLEFT",  -8, -13)
	Debuffs:SetPoint("RIGHT", Minimap, "BOTTOMLEFT", -6, 15)
end

function Auras:Skin()
	baseSkin(self)
	
	local Duration = self.Duration
	local Icon = self.Icon
	
	self:PatUI(nil, "Single")
	Icon:SetInside(self, 1, 1)
	self.Backdrop:SetBackdropBorderColor(0, 0, 0)

	self.Backdrop:CreateThinShadow()
	self.Backdrop.Shadow:SetOutside(self.Backdrop, 5, 5)

	Duration:ClearAllPoints()
	Duration:SetPoint("BOTTOM", 0, 2)
end
