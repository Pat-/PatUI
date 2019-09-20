local T, C, L = Tukui:unpack()

local Auras = T["Auras"]
local Minimap = T["Maps"]["Minimap"]

local baseCreateHeaders = Auras.CreateHeaders
local baseSkin = Auras.Skin

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
	if C["PatUI"]["ThickBorders"] == true then
		Buffs:SetAttribute("xOffset", -35)
	else
		Buffs:SetAttribute("xOffset", -33)
	end
	Buffs:SetAttribute("wrapYOffset", -36)
	
	Buffs:SetPoint("RIGHT", Minimap, "TOPLEFT",  -4, -16)
	Debuffs:SetPoint("RIGHT", Minimap, "BOTTOMLEFT", -4, 16)
end

function Auras:Skin()
	baseSkin(self)
	
	local Duration = self.Duration
	
	if C["PatUI"]["ThickBorders"] == true then
		self.Shadow:Kill()
	
		local bg = CreateFrame("Frame", nil, self)
		bg:SetFrameLevel(self:GetFrameLevel() - 1)
		bg:Point("TOPLEFT", self, -1.5, 1.5)
		bg:Point("BOTTOMRIGHT", self, 1.5, -1.5)
		bg:Size(1, 1)
		bg:PatUI("Transparent")
		bg:CreateShadow()
	end
	
	Duration:ClearAllPoints()
	Duration:SetPoint("BOTTOM", 0, 2)
end