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
	buttonBG:SetBackdropBorderColor(0, 0, 0, 0)
	buttonBG:HideInsets()
	buttonBG:SetFrameLevel(Button.backdrop:GetFrameLevel() - 1)
	
end
hooksecurefunc("ActionButton_Update", style)


function P.StyleActionBarPetAndShiftButton(normal, button, icon, name, pet)
	if button.isSkinned then return end
	
	button:SetWidth(P.petbuttonsize)
	button:SetHeight(P.petbuttonsize)
	button:CreateBackdrop()
	button:HideInsets()
	button.backdrop:Kill()
	icon:SetTexCoord(.08, .92, .08, .92)
	icon:ClearAllPoints()
	icon:SetInside()
	if pet then			
		if P.petbuttonsize < 30 then
			local autocast = _G[name.."AutoCastable"]
			autocast:SetAlpha(0)
		end
		local shine = _G[name.."Shine"]
		shine:Size(P.petbuttonsize, P.petbuttonsize)
		shine:ClearAllPoints()
		shine:HideInsets()
		shine:SetPoint("CENTER", button, 0, 0)
		icon:Point("TOPLEFT", button, 2, -2)
		icon:Point("BOTTOMRIGHT", button, -2, 2)
		icon:HideInsets()
	end
	
	--Border for the action bar.
	local buttonBG = CreateFrame("Frame", buttonBG, button)	
	buttonBG:ClearAllPoints()
	buttonBG:SetPoint("TOPLEFT", 2, -2)
	buttonBG:SetPoint("BOTTOMRIGHT", -2, 2)
	buttonBG:Size(1, 1)
	buttonBG:SetTemplate("Transparent")
	buttonBG:SetBorder(false, true)
	buttonBG:SetBackdropBorderColor(0, 0, 0, 0)
	buttonBG:HideInsets()
	buttonBG:SetFrameLevel(button:GetFrameLevel() - 1)
	
	button:SetNormalTexture("")
	button.SetNormalTexture = P.dummy
	
	local Flash	 = _G[name.."Flash"]
	Flash:SetTexture("")
	
	if normal then
		normal:ClearAllPoints()
		normal:SetPoint("TOPLEFT")
		normal:SetPoint("BOTTOMRIGHT")
		normal:HideInsets()
	end
	
	button:StyleButton()
	button.isSkinned = true
end

function P.StyleShift()
	for i=1, NUM_STANCE_SLOTS do
		local name = "StanceButton"..i
		local button  = _G[name]
		local icon  = _G[name.."Icon"]
		local normal  = _G[name.."NormalTexture"]
		P.StyleActionBarPetAndShiftButton(normal, button, icon, name)
	end
end

function P.StylePet()
	for i=1, NUM_PET_ACTION_SLOTS do
		local name = "PetActionButton"..i
		local button  = _G[name]
		local icon  = _G[name.."Icon"]
		local normal  = _G[name.."NormalTexture2"]
		P.StyleActionBarPetAndShiftButton(normal, button, icon, name, true)
	end
end