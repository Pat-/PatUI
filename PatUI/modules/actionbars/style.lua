local P, C, L, G = unpack(Tukui)

local function style(self)
	local Button = self
	local name = self:GetName()
	local Btname = _G[name .. "Name"]
	local Normal = _G[name.."NormalTexture"]
	local Icon = _G[name.."Icon"]
	local Border = _G[name.."Border"]
	local Flash = _G[name.."Flash"]
	
	--> fixing a taint issue while changing totem flyout button in combat.
	if name:match("MultiCast") then return end
	
	--> don't skin the boss encounter extra button to match texture (4.3 patch)
	--> http://www.tukui.org/storage/viewer.php?id=913811extrabar.jpg
	if name:match("ExtraActionButton") then return end
	
	local Count = _G[name.."Count"]
	local HotKey = _G[name.."HotKey"]
	
	Count:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
	HotKey:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
	
	Icon:Point("TOPLEFT", Button, 2, -2)
	Icon:Point("BOTTOMRIGHT", Button, -2, 2)
	
	Button:SetBorder(false, false)
	
	Button.backdrop:HideInsets()
	Button.backdrop:SetBackdropBorderColor(0,0,0,0)
	Button.backdrop:SetBackdropColor(0,0,0,0)
	
	--Border for the action bar.
	local buttonBG = CreateFrame("Frame", buttonBG, Button.backdrop)	
	buttonBG:ClearAllPoints()
	buttonBG:SetPoint("TOPLEFT", 2, -2)
	buttonBG:SetPoint("BOTTOMRIGHT", -2, 2)
	buttonBG:Size(1, 1)
	buttonBG:SetTemplate("Transparent")
	buttonBG:SetBorder(false, true)
	buttonBG:SetBackdropBorderColor(0,0,0,0)
	buttonBG:HideInsets()
	buttonBG:SetFrameLevel(Button.backdrop:GetFrameLevel() - 1)
	
end
hooksecurefunc("ActionButton_Update", style)
