local P, C, L, G = unpack(Tukui)

TukuiTooltipAnchor:ClearAllPoints()
TukuiTooltipAnchor:SetClampedToScreen(false)
TukuiTooltipAnchor:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, -25)

-- Make Tooltip Transparent
local Tooltips = {GameTooltip, ShoppingTooltip1, ShoppingTooltip2, ShoppingTooltip3, WorldMapTooltip, WorldMapCompareTooltip1, WorldMapCompareTooltip2, WorldMapCompareTooltip3}

local SetStyle = function(self)
	self:PatSkin()
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
		self:PatSkin()
		end)
	end
end)

GameTooltipStatusBar:HookScript("OnValueChanged", function(self, value)
	if self.text then self.text:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE") end
end)

if P.myrealm == "Emerald Dream" then
	--C.actionbar.hotkey = true
	C.actionbar.macro = true
end