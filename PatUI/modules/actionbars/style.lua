local P, C, L, G = unpack(Tukui)

local function style(self)
	local name = self:GetName()
	
	--> fixing a taint issue while changing totem flyout button in combat.
	if name:match("MultiCast") then return end
	
	--> don't skin the boss encounter extra button to match texture (4.3 patch)
	--> http://www.tukui.org/storage/viewer.php?id=913811extrabar.jpg
	if name:match("ExtraActionButton") then return end
	
	local Count = _G[name.."Count"]
	local HotKey = _G[name.."HotKey"]
	
	Count:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
	HotKey:SetFont(C["media"].font, 12, "THINOUTLINE33")
end
hooksecurefunc("ActionButton_Update", style)
