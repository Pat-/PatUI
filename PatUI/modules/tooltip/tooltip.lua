local T, C, L = Tukui:unpack()

local Tooltip = T["Tooltips"]
local HealthBar = GameTooltipStatusBar

local baseCreateAnchor = Tooltip.CreateAnchor
local baseSkin = Tooltip.Skin
local baseSkinHealthBar = Tooltip.SkinHealthBar
local baseSetUnitBorderColor = Tooltip.SetUnitBorderColor
local baseResetBorderColor = Tooltip.ResetBorderColor
local baseEnable = Tooltip.Enable

function Tooltip:CreateAnchor()
	-- Call the base function first
	baseCreateAnchor(self)
	
	-- Make sure tooltip Anchors to where we want it before we override bag functions
	local Anchor = Tooltip["Anchor"]
	local Container = _G["TukuiBag"]
	local RightChatBG = TukuiChatRightBackground

	Anchor:ClearAllPoints()
	Anchor:SetPoint("BOTTOMRIGHT", RightChatBG, "TOPRIGHT", -1, 2)
	
	Container:HookScript("OnShow", function()
		Anchor:SetPoint("BOTTOMRIGHT", Container, "TOPRIGHT", -1, -22)
	end)
	
	Container:HookScript("OnHide", function()
		Anchor:SetPoint("BOTTOMRIGHT", RightChatBG, "TOPRIGHT", -1, 2)
	end)
end

--To skin tooltip properly, have to replace Tukz skin function with our own
function PatUI:Skin(style)
	if self:IsForbidden() or self == GameTooltipTooltip then
		return
	end
	
	if (not self.IsSkinned) then
		self:StripTextures()
		self:PatUI("Transparent", "Single")
		self.Backdrop:SetBackdropBorderColor(0, 0, 0)
	
		self:CreateThinShadow()
		self.Shadow:SetOutside(self.Backdrop, 5, 5)
		
		self.IsSkinned = true
	end

	local Link = select(2, self:GetItem())
	local R, G, B
	local Backdrop = self.Backdrop
	
	if Backdrop then
		if Link then
			local Quality = select(3, GetItemInfo(Link))

			if Quality then
				R, G, B = GetItemQualityColor(Quality)
			else
				R, G, B = unpack(C["PatUI"]["BorderColor"])
			end
			
			Backdrop:SetBorderColor(R, G, B)
		else
			Backdrop:SetBorderColor(unpack(C["PatUI"]["BorderColor"]))
		end
	end

	-- SetBackdrop prevents tooltip from breaking but does remove transparency
	self:SetBackdropColor(0.11, 0.11, 0.11, 0)
end

-- nil out Tukz skin function so our own is used instead
function Tooltip:Skin()
	return 
end

function Tooltip:SkinHealthBar()
	baseSkinHealthBar(self)

	HealthBar:ClearAllPoints()
	HealthBar:SetPoint("BOTTOMLEFT", HealthBar:GetParent(), "TOPLEFT", 1, 6)
	HealthBar:SetPoint("BOTTOMRIGHT", HealthBar:GetParent(), "TOPRIGHT", -1, 6)

	HealthBar:SetHeight(2)

	HealthBar:PatUI(nil, "Single")
	HealthBar.Backdrop:SetOutside()
	HealthBar.Backdrop:SetBackdropBorderColor(0, 0, 0)

	HealthBar:CreateThinShadow()
	HealthBar.Shadow:SetOutside(HealthBar.Backdrop, 5, 5)
end

function Tooltip:SetUnitBorderColor()
	baseSetUnitBorderColor(self)

	local Unit = self
	local R, G, B
	local GameTooltip = GameTooltip
	
	local Reaction = Unit and UnitReaction(Unit, "player")
	local Player = Unit and UnitIsPlayer(Unit)
	local Friend = Unit and UnitIsFriend("player", Unit)

	if Player and Friend then
		HealthBar.Backdrop:SetBorderColor(unpack(C["PatUI"]["BorderColor"]))

		GameTooltip.Backdrop:SetBorderColor(unpack(C["PatUI"]["BorderColor"]))
	elseif Reaction then
		HealthBar.Backdrop:SetBorderColor(unpack(C["PatUI"]["BorderColor"]))

		GameTooltip.Backdrop:SetBorderColor(unpack(C["PatUI"]["BorderColor"]))
	end
end

function Tooltip:ResetBorderColor()
	baseResetBorderColor(self)

	if self ~= GameTooltip then
		return
	end
	
	if self.Backdrop then
		self.Backdrop:SetBorderColor(unpack(C["PatUI"]["BorderColor"]))
	end
end

function Tooltip:Enable()
	baseEnable(self)

	PatUI.Skin(GameTooltip)
	PatUI.Skin(ItemRefTooltip)
	PatUI.Skin(EmbeddedItemTooltip)
	PatUI.Skin(ShoppingTooltip1)
	PatUI.Skin(ShoppingTooltip2)
end