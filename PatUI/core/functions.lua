local T, C, L = Tukui:unpack()
local Toolkit = T00LKIT
local Settings = Toolkit.Settings
local API = Toolkit.API
local Functions = Toolkit.Functions
local Scales = Toolkit.UIScales
local Frames = Toolkit.Frames

T.SetFontString = function(parent, fontName, fontHeight, fontStyle)
	local fs = parent:CreateFontString(nil, "OVERLAY")
	fs:SetFont(fontName, fontHeight, fontStyle)
	fs:SetJustifyH("LEFT")
	return fs
end

Toolkit.API.PatUI = function(self, t, tex)
	local balpha = 1
	if t == "Transparent" then balpha = 0.8 end
	local backdropr, backdropg, backdropb = unpack(C.General.BackdropColor)
	local backdropa = balpha
	local texture = C.Medias.Blank

	if tex then
		texture = C.Medias.Normal
	end

	self:SetBackdrop({
		bgFile = texture,
		edgeFile = C.Medias.Blank,
		tile = false, tileSize = 0, edgeSize = Toolkit.Functions.Scale(1),
	})

	if (not self.isInsetDone) then
		self.insettop = self:CreateTexture(nil, "BORDER")
		self.insettop:Point("TOPLEFT", self, "TOPLEFT", -1, 1)
		self.insettop:Point("TOPRIGHT", self, "TOPRIGHT", 1, -1)
		self.insettop:Height(1)
		self.insettop:SetColorTexture(.0,.0,.0)
		self.insettop:SetDrawLayer("BORDER", -7)

		self.insetbottom = self:CreateTexture(nil, "BORDER")
		self.insetbottom:Point("BOTTOMLEFT", self, "BOTTOMLEFT", -1, -1)
		self.insetbottom:Point("BOTTOMRIGHT", self, "BOTTOMRIGHT", 1, -1)
		self.insetbottom:Height(1)
		self.insetbottom:SetColorTexture(.0,.0,.0)
		self.insetbottom:SetDrawLayer("BORDER", -7)

		self.insetleft = self:CreateTexture(nil, "BORDER")
		self.insetleft:Point("TOPLEFT", self, "TOPLEFT", -1, 1)
		self.insetleft:Point("BOTTOMLEFT", self, "BOTTOMLEFT", 1, -1)
		self.insetleft:Width(1)
		self.insetleft:SetColorTexture(.0,.0,.0)
		self.insetleft:SetDrawLayer("BORDER", -7)

		self.insetright = self:CreateTexture(nil, "BORDER")
		self.insetright:Point("TOPRIGHT", self, "TOPRIGHT", 1, 1)
		self.insetright:Point("BOTTOMRIGHT", self, "BOTTOMRIGHT", -1, -1)
		self.insetright:Width(1)
		self.insetright:SetColorTexture(.0,.0,.0)
		self.insetright:SetDrawLayer("BORDER", -7)

		self.insetinsidetop = self:CreateTexture(nil, "BORDER")
		self.insetinsidetop:Point("TOPLEFT", self, "TOPLEFT", 1, -1)
		self.insetinsidetop:Point("TOPRIGHT", self, "TOPRIGHT", -1, 1)
		self.insetinsidetop:Height(1)
		self.insetinsidetop:SetColorTexture(.0,.0,.0)
		self.insetinsidetop:SetDrawLayer("BORDER", -7)

		self.insetinsidebottom = self:CreateTexture(nil, "BORDER")
		self.insetinsidebottom:Point("BOTTOMLEFT", self, "BOTTOMLEFT", 1, 1)
		self.insetinsidebottom:Point("BOTTOMRIGHT", self, "BOTTOMRIGHT", -1, 1)
		self.insetinsidebottom:Height(1)
		self.insetinsidebottom:SetColorTexture(.0,.0,.0)
		self.insetinsidebottom:SetDrawLayer("BORDER", -7)

		self.insetinsideleft = self:CreateTexture(nil, "BORDER")
		self.insetinsideleft:Point("TOPLEFT", self, "TOPLEFT", 1, -1)
		self.insetinsideleft:Point("BOTTOMLEFT", self, "BOTTOMLEFT", -1, 1)
		self.insetinsideleft:Width(1)
		self.insetinsideleft:SetColorTexture(.0,.0,.0)
		self.insetinsideleft:SetDrawLayer("BORDER", -7)

		self.insetinsideright = self:CreateTexture(nil, "BORDER")
		self.insetinsideright:Point("TOPRIGHT", self, "TOPRIGHT", -1, -1)
		self.insetinsideright:Point("BOTTOMRIGHT", self, "BOTTOMRIGHT", 1, 1)
		self.insetinsideright:Width(1)
		self.insetinsideright:SetColorTexture(.0,.0,.0)
		self.insetinsideright:SetDrawLayer("BORDER", -7)

		self.isInsetDone = true
	end

	self:SetBackdropColor(backdropr, backdropg, backdropb, backdropa)
	self:SetBackdropBorderColor(.2, .2, .2)
end

-- Enable the API
Toolkit:Enable()

-- Need these for some weird reason
Settings.NormalTexture = C.Medias.Blank
Settings.ShadowTexture = C.Medias.Glow
Settings.DefaultFont = C.Medias.Font
Settings.BackdropColor = C.General.BackdropColor
Settings.BorderColor = C.General.BorderColor
Settings.ArrowUpTexture = "Interface\\AddOns\\Tukui\\Medias\\Textures\\Others\\ArrowUp"
Settings.ArrowDownTexture = "Interface\\AddOns\\Tukui\\Medias\\Textures\\Others\\ArrowDown"
Settings.CloseTexture = "Interface\\AddOns\\Tukui\\Medias\\Textures\\Others\\Close"
