local P, C, L, G = unpack(Tukui)

-- just for creating text
P.SetFontString = function(parent, fontName, fontHeight, fontStyle)
	local fs = parent:CreateFontString(nil, "OVERLAY")
	fs:SetFont(fontName, fontHeight, fontStyle)
	fs:SetJustifyH("LEFT")
	return fs
end

-- set the position of the datatext tooltip
P.DataTextTooltipAnchor = function(self)
	local panel = self:GetParent()
	local anchor = "ANCHOR_BOTTOM"
	local xoff = 0
	local yoff = P.Scale(-3)
	
	if panel == TukuiInfoLeft then
		anchor = "ANCHOR_TOPLEFT"
	elseif panel == TukuiInfoRight then
		anchor = "ANCHOR_TOPRIGHT"
	elseif panel == TukuiMinimapStatsLeft or panel == TukuiMinimapStatsRight then
		local position = TukuiMinimap:GetPoint()
		if position:match("LEFT") then
			anchor = "ANCHOR_BOTTOMRIGHT"
			yoff = P.Scale(-6)
			xoff = 0 - TukuiMinimapStatsRight:GetWidth()
		elseif position:match("RIGHT") then
			anchor = "ANCHOR_BOTTOMLEFT"
			yoff = P.Scale(-6)
			xoff = TukuiMinimapStatsRight:GetWidth()
		else
			anchor = "ANCHOR_BOTTOM"
			yoff = P.Scale(-6)
		end
	end
	
	return anchor, panel, xoff, yoff
end

-- a function to move name of current target unit if enemy or friendly
P.PostNamePosition = function(self)
	self.Name:ClearAllPoints()
	if (self.Power.value:GetText() and UnitIsEnemy("player", "target") and C["unitframes"].targetpowerpvponly == true) or (self.Power.value:GetText() and C["unitframes"].targetpowerpvponly == false) then
		self.Name:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
	else
		self.Power.value:SetAlpha(0)
		self.Name:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
	end
end
