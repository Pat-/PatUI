local P, C, L, G = unpack(Tukui)

local function SetBorder(f, i, o)
	if i then
		if f.iborder then return end
		local border = CreateFrame("Frame", f:GetName() and f:GetName() .. "InnerBorder" or nil, f)
		border:Point("TOPLEFT", P.mult, -P.mult)
		border:Point("BOTTOMRIGHT", -P.mult, P.mult)
		border:SetBackdrop({
			edgeFile = C["media"].blank, 
			edgeSize = P.mult, 
			insets = { left = P.mult, right = P.mult, top = P.mult, bottom = P.mult }
		})
		border:SetBackdropBorderColor(0, 0, 0)
		f.iborder = border
	end
	
	if o then
		if f.oborder then return end
		local border = CreateFrame("Frame", f:GetName() and f:GetName() .. "OuterBorder" or nil, f)
		border:Point("TOPLEFT", -P.mult, P.mult)
		border:Point("BOTTOMRIGHT", P.mult, -P.mult)
		border:SetBackdrop({
			edgeFile = C["media"].blank, 
			edgeSize = P.mult, 
			insets = { left = P.mult, right = P.mult, top = P.mult, bottom = P.mult }
		})
		border:SetBackdropBorderColor(0, 0, 0)
		f.oborder = border
	end
end

local function AllPoints(obj, frame, inset)
	if not inset then inset = 0 end
	obj:SetPoint("TOPLEFT", frame, "TOPLEFT", inset, -inset)
	obj:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -inset, inset)
end

local function innerBorder(f)
	if f.innerborder then f.innerborder:Show() return end
	f.innerborder = CreateFrame("Frame", nil, f)
	f.innerborder:SetPoint("TOPLEFT", P.mult, -P.mult)
	f.innerborder:SetPoint("BOTTOMRIGHT", -P.mult, P.mult)
	f.innerborder:SetBackdrop({
		edgeFile = C.media.blank, 
		edgeSize = P.mult, 
		insets = { left = P.mult, right = P.mult, top = P.mult, bottom = P.mult }
	})
	f.innerborder:SetBackdropBorderColor(0,0,0)
	
end

local function outerBorder(f)
	if f.outerborder then f.outerborder:Show() return end
	f.outerborder = CreateFrame("Frame", nil, f)
	f.outerborder:SetPoint("TOPLEFT", -P.mult, P.mult)
	f.outerborder:SetPoint("BOTTOMRIGHT", P.mult, -P.mult)
	f.outerborder:SetBackdrop({
		edgeFile = C.media.blank, 
		edgeSize = P.mult, 
		insets = { left = P.mult, right = P.mult, top = P.mult, bottom = P.mult }
	})
	f.outerborder:SetBackdropBorderColor(0,0,0)
	
end

local function ThickBorder(f, force)
	if f.backdrop and not force then
		outerBorder(f.backdrop)
		innerBorder(f.backdrop)
	else
		outerBorder(f)
		innerBorder(f)
	end
end

local function CreateBorder(self)
	if(self:GetFrameStrata() == "BACKGROUND") then self:SetFrameStrata("LOW") end

	local border = CreateFrame("Frame", nil, self)
	border:SetPoint("TOPLEFT", self, "TOPLEFT", P.Scale(-2), P.Scale(2))
	border:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", P.Scale(2), P.Scale(-2))
	border:SetTemplate("Transparent")
	border:SetFrameLevel(self:GetFrameLevel())
	ThickBorder(border)
end

-- using Elvz code to skin transmog frame when you're about to use an item that can be still be returned for a refund.
function HandleItemButton(b, shrinkIcon)
	if b.isSkinned then return; end

	b:StripTextures()
	b:CreateBackdrop("Default")
	b:StyleButton()
	
	local icon = b.icon or b.IconTexture
	if b:GetName() and _G[b:GetName()..'IconTexture'] then
		icon = _G[b:GetName()..'IconTexture']
	elseif b:GetName() and _G[b:GetName()..'Icon'] then
		icon = _G[b:GetName()..'Icon']
	end
	
	if icon then
		icon:SetTexCoord(.08, .92, .08, .92)

		-- create a backdrop around the icon
		
		if shrinkIcon then
			b.backdrop:SetAllPoints()
			icon:SetInside(b)
		else
			b.backdrop:SetOutside(icon)
		end
		icon:SetParent(b.backdrop)
	end
	b.isSkinned = true
end

P.RoleIconUpdate = function(self, event)
	local lfdrole = self.LFDRole

	local role = UnitGroupRolesAssigned(self.unit)

	if(role == 'TANK' or role == 'HEALER' or role == 'DAMAGER') and UnitIsConnected(self.unit) then
		if role == 'TANK' then
			lfdrole:SetTexture([[Interface\AddOns\PatUI\media\textures\tank.tga]])
		elseif role == 'HEALER' then
			lfdrole:SetTexture([[Interface\AddOns\PatUI\media\textures\healer.tga]])
		elseif role == 'DAMAGER' then
			lfdrole:SetTexture([[Interface\AddOns\PatUI\media\textures\dps.tga]])
		end
		
		lfdrole:Show()
	else
		lfdrole:Hide()
	end	
end

-- the hell didn't I even think of this but Flying did? :O
local function PatSkin(f)
	f:SetTemplate("Transparent")
	ThickBorder(f)
end

local function addapi(object)
	local mt = getmetatable(object).__index
	if not object.CreateBorder then mt.CreateBorder = CreateBorder end
	if not object.SetBorder then mt.SetBorder = SetBorder end
	if not object.AllPoints then mt.AllPoints = AllPoints end
	if not object.ThickBorder then mt.ThickBorder = ThickBorder end
	if not object.InnerBorder then mt.Innerborder = innerBorder end
	if not object.OuterBorder then mt.Outerborder = outerBorder end
	if not object.PatSkin then mt.PatSkin = PatSkin end
	if not object.HandleItemButton then mt.HandleItemButton = HandleItemButton end
end

local handled = {["Frame"] = true}
local object = CreateFrame("Frame")
addapi(object)
addapi(object:CreateTexture())
addapi(object:CreateFontString())

object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi(object)
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames(object)
end
