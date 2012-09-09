local P, C, L, G = unpack(Tukui)

-- used for testing things
TukuiTooltipAnchor:ClearAllPoints()
TukuiTooltipAnchor:SetPoint("BOTTOMRIGHT", ChatBackground2, "TOPRIGHT", 0, -TukuiInfoRight:GetHeight())


-- Make Tooltip Transparent
local Tooltips = {GameTooltip,ShoppingTooltip1,ShoppingTooltip2,ShoppingTooltip3,WorldMapTooltip,WorldMapCompareTooltip1,WorldMapCompareTooltip2,WorldMapCompareTooltip3}

-- need to ask Tukz to make this global
local BorderColor = function(self)
	local GMF = GetMouseFocus()
	local unit = (select(2, self:GetUnit())) or (GMF and GMF:GetAttribute("unit"))
		
	local reaction = unit and UnitReaction(unit, "player")
	local player = unit and UnitIsPlayer(unit)
	local tapped = unit and UnitIsTapped(unit)
	local tappedbyme = unit and UnitIsTappedByPlayer(unit)
	local connected = unit and UnitIsConnected(unit)
	local dead = unit and UnitIsDead(unit)
	local r, g, b

	if player then
		local class = select(2, UnitClass(unit))
		local c = P.UnitColor.class[class]
		r, g, b = c[1], c[2], c[3]
		self:SetBackdropBorderColor(r, g, b)
		G.Tooltips.GameTooltip.Health.Background:SetBackdropBorderColor(r, g, b)
		G.Tooltips.GameTooltip.Health:SetStatusBarColor(r, g, b)
	elseif reaction then
		local c = P.UnitColor.reaction[reaction]
		r, g, b = c[1], c[2], c[3]
		self:SetBackdropBorderColor(r, g, b)
		G.Tooltips.GameTooltip.Health.Background:SetBackdropBorderColor(r, g, b)
		G.Tooltips.GameTooltip.Health:SetStatusBarColor(r, g, b)
	else
		local _, link = self:GetItem()
		local quality = link and select(3, GetItemInfo(link))
		if quality and quality >= 2 then
			local r, g, b = GetItemQualityColor(quality)
			self:SetBackdropBorderColor(r, g, b)
		else
			self:SetBackdropBorderColor(unpack(C["media"].bordercolor))
			G.Tooltips.GameTooltip.Health.Background:SetBackdropBorderColor(unpack(C["media"].bordercolor))
			G.Tooltips.GameTooltip.Health:SetStatusBarColor(unpack(C["media"].bordercolor))
		end
	end
	
	-- need this
	NeedBackdropBorderRefresh = true
end

local SetStyle = function(self)
	self:SetTemplate("Transparent")
	self:ThickBorder()
	BorderColor(self)
end

TukuiTooltip:HookScript("OnEvent", function(self, event, addon)
	for _, tt in pairs(Tooltips) do
		tt:HookScript("OnShow", SetStyle)
	end
	
	ItemRefTooltip:HookScript("OnTooltipSetItem", SetStyle)
	ItemRefTooltip:HookScript("OnShow", SetStyle)
end)