local P, C, L, G = unpack(Tukui)

TukuiTooltipAnchor:ClearAllPoints()
TukuiTooltipAnchor:SetClampedToScreen(false)
TukuiTooltipAnchor:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, -25)

-- Make Tooltip Transparent
local Tooltips = {GameTooltip, ShoppingTooltip1, ShoppingTooltip2, ShoppingTooltip3, WorldMapTooltip, WorldMapCompareTooltip1, WorldMapCompareTooltip2, WorldMapCompareTooltip3}

local SetStyle = function(self)
	self:SetTemplate("Transparent")
	self:SetBorder(false, true)
	self:SetBackdropBorderColor(0, 0, 0, 0)
	self:HideInsets()
end

TukuiTooltip:HookScript("OnEvent", function(self, event, addon)
	for _, tt in pairs(Tooltips) do
		tt:HookScript("OnShow", SetStyle)
	end
	
	ItemRefTooltip:HookScript("OnTooltipSetItem", SetStyle)
	ItemRefTooltip:HookScript("OnShow", SetStyle)
	
	if FrameStackTooltip then
		FrameStackTooltip:SetScale(C.general.uiscale)
		
		-- Skin it
		FrameStackTooltip:HookScript("OnShow", function(self) 
		self:SetTemplate("Transparent") 
		FrameStackTooltip:SetBackdropBorderColor(0, 0, 0, 0)
		FrameStackTooltip:HideInsets()
		FrameStackTooltip:SetBorder(false, true)
		end)
	end
end)

G.Tooltips.GameTooltip.Health:SetBackdropBorderColor(0, 0, 0, 0)
G.Tooltips.GameTooltip.Health:HideInsets()
G.Tooltips.GameTooltip.Health:SetBorder(false, true)

local healthbackground = CreateFrame("Frame", healthbackground, G.Tooltips.GameTooltip.Health)
healthbackground:ClearAllPoints()
healthbackground:Point("TOPLEFT", 0, 0)
healthbackground:Point("BOTTOMRIGHT", 0, 0)
healthbackground:Size(1, 1)
healthbackground:SetTemplate("Transparent")
healthbackground:HideInsets()
healthbackground:SetBackdropBorderColor(0, 0, 0, 0)
healthbackground:SetFrameStrata("BACKGROUND")

G.Tooltips.GameTooltip.Health.Background:SetBackdropBorderColor(0, 0, 0, 0)
G.Tooltips.GameTooltip.Health.Background:HideInsets()
G.Tooltips.GameTooltip.Health.Background:SetAlpha(0)
