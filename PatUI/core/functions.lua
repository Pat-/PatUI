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

API.PatUI = function(self, BackgroundTemplate, Border, BackgroundTexture, BorderTemplate)
	self.Backdrop = CreateFrame("Frame", nil, self, "BackdropTemplate")
	self.Backdrop:SetAllPoints()
	self.Backdrop:SetFrameLevel(self:GetFrameLevel())
	self.Backdrop:SetFrameStrata(self:GetFrameStrata())

	local BackgroundAlpha = (BackgroundTemplate == "Transparent" and Settings.Transparency) or (1)
	local BorderR, BorderG, BorderB = .28, .28, .28
	local BackdropR, BackdropG, BackdropB = unpack(Settings.BackdropColor)
	local BorderSize = (Border == "Single" and 1) or (2)

	self.Backdrop:SetBackdrop({
		bgFile = BackgroundTexture or Settings.NormalTexture,
		edgeFile = C.Medias.Blank,
		tile = false, tileSize = 0, edgeSize = Functions.Scale(1),
	})

	self.Backdrop.BorderTop = self.Backdrop:CreateTexture(nil, "BORDER")
	self.Backdrop.BorderTop:SetHeight(BorderSize)
	self.Backdrop.BorderTop:SetColorTexture(.0,.0,.0)
	self.Backdrop.BorderTop:SetDrawLayer("BORDER", -7)

	self.Backdrop.BorderBottom = self.Backdrop:CreateTexture(nil, "BORDER")
	self.Backdrop.BorderBottom:SetHeight(BorderSize)
	self.Backdrop.BorderBottom:SetColorTexture(.0,.0,.0)
	self.Backdrop.BorderBottom:SetDrawLayer("BORDER", -7)

	self.Backdrop.BorderLeft = self.Backdrop:CreateTexture(nil, "BORDER")
	self.Backdrop.BorderLeft:SetWidth(BorderSize)
	self.Backdrop.BorderLeft:SetColorTexture(.0,.0,.0)
	self.Backdrop.BorderLeft:SetDrawLayer("BORDER", -7)

	self.Backdrop.BorderRight = self.Backdrop:CreateTexture(nil, "BORDER")
	self.Backdrop.BorderRight:SetWidth(BorderSize)
	self.Backdrop.BorderRight:SetColorTexture(.0,.0,.0)
	self.Backdrop.BorderRight:SetDrawLayer("BORDER", -7)

	self.Backdrop.InsideTop = self.Backdrop:CreateTexture(nil, "BORDER")
	self.Backdrop.InsideTop:SetHeight(1)
	self.Backdrop.InsideTop:SetColorTexture(.0,.0,.0)
	self.Backdrop.InsideTop:SetDrawLayer("BORDER", -7)

	self.Backdrop.InsideBottom = self.Backdrop:CreateTexture(nil, "BORDER")
	self.Backdrop.InsideBottom:SetHeight(1)
	self.Backdrop.InsideBottom:SetColorTexture(.0,.0,.0)
	self.Backdrop.InsideBottom:SetDrawLayer("BORDER", -7)

	self.Backdrop.InsideLeft = self.Backdrop:CreateTexture(nil, "BORDER")
	self.Backdrop.InsideLeft:SetWidth(1)
	self.Backdrop.InsideLeft:SetColorTexture(.0,.0,.0)
	self.Backdrop.InsideLeft:SetDrawLayer("BORDER", -7)

	self.Backdrop.InsideRight = self.Backdrop:CreateTexture(nil, "BORDER")
	self.Backdrop.InsideRight:SetWidth(1)
	self.Backdrop.InsideRight:SetColorTexture(.0,.0,.0)
	self.Backdrop.InsideRight:SetDrawLayer("BORDER", -7)

	if Border == "Single" then
		self.Backdrop.BorderTop:SetPoint("TOPLEFT", self.Backdrop, "TOPLEFT", -1, 1)
		self.Backdrop.BorderTop:SetPoint("TOPRIGHT", self.Backdrop, "TOPRIGHT", 1, -1)

		self.Backdrop.BorderBottom:SetPoint("BOTTOMLEFT", self.Backdrop, "BOTTOMLEFT", -1, -1)
		self.Backdrop.BorderBottom:SetPoint("BOTTOMRIGHT", self.Backdrop, "BOTTOMRIGHT", 1, -1)

		self.Backdrop.BorderLeft:SetPoint("TOPLEFT", self.Backdrop, "TOPLEFT", -1, 1)
		self.Backdrop.BorderLeft:SetPoint("BOTTOMLEFT", self.Backdrop, "BOTTOMLEFT", 1, -1)

		self.Backdrop.BorderRight:SetPoint("TOPRIGHT", self.Backdrop, "TOPRIGHT" , 1, 1)
		self.Backdrop.BorderRight:SetPoint("BOTTOMRIGHT", self.Backdrop, "BOTTOMRIGHT", -1, -1)

		self.Backdrop.InsideTop:SetPoint("TOPLEFT", self.Backdrop, "TOPLEFT", -2, 2)
		self.Backdrop.InsideTop:SetPoint("TOPRIGHT", self.Backdrop, "TOPRIGHT", 2, -2)

		self.Backdrop.InsideBottom:SetPoint("BOTTOMLEFT", self.Backdrop, "BOTTOMLEFT", -2, -2)
		self.Backdrop.InsideBottom:SetPoint("BOTTOMRIGHT", self.Backdrop, "BOTTOMRIGHT", 2, -2)

		self.Backdrop.InsideLeft:SetPoint("TOPLEFT", self.Backdrop, "TOPLEFT", -2, 2)
		self.Backdrop.InsideLeft:SetPoint("BOTTOMLEFT", self.Backdrop, "BOTTOMLEFT", 2, -2)

		self.Backdrop.InsideRight:SetPoint("TOPRIGHT", self.Backdrop, "TOPRIGHT", 2, 2)
		self.Backdrop.InsideRight:SetPoint("BOTTOMRIGHT", self.Backdrop, "BOTTOMRIGHT", 2, -2)
	else
		self.Backdrop.BorderTop:SetPoint("TOPLEFT", self.Backdrop, "TOPLEFT", -2, 2)
		self.Backdrop.BorderTop:SetPoint("TOPRIGHT", self.Backdrop, "TOPRIGHT", 2, -2)

		self.Backdrop.BorderBottom:SetPoint("BOTTOMLEFT", self.Backdrop, "BOTTOMLEFT", -2, -2)
		self.Backdrop.BorderBottom:SetPoint("BOTTOMRIGHT", self.Backdrop, "BOTTOMRIGHT", 2, -2)

		self.Backdrop.BorderLeft:SetPoint("TOPLEFT", self.Backdrop, "TOPLEFT", -2, 2)
		self.Backdrop.BorderLeft:SetPoint("BOTTOMLEFT", self.Backdrop, "BOTTOMLEFT", 2, -2)

		self.Backdrop.BorderRight:SetPoint("TOPRIGHT", self.Backdrop, "TOPRIGHT" , 2, 2)
		self.Backdrop.BorderRight:SetPoint("BOTTOMRIGHT", self.Backdrop, "BOTTOMRIGHT", -2, -2)

		self.Backdrop.InsideTop:SetPoint("TOPLEFT", self.Backdrop, "TOPLEFT", -3, 3)
		self.Backdrop.InsideTop:SetPoint("TOPRIGHT", self.Backdrop, "TOPRIGHT", 3, -3)

		self.Backdrop.InsideBottom:SetPoint("BOTTOMLEFT", self.Backdrop, "BOTTOMLEFT", -3, -3)
		self.Backdrop.InsideBottom:SetPoint("BOTTOMRIGHT", self.Backdrop, "BOTTOMRIGHT", 3, -3)

		self.Backdrop.InsideLeft:SetPoint("TOPLEFT", self.Backdrop, "TOPLEFT", -3, 3)
		self.Backdrop.InsideLeft:SetPoint("BOTTOMLEFT", self.Backdrop, "BOTTOMLEFT", 3, -3)

		self.Backdrop.InsideRight:SetPoint("TOPRIGHT", self.Backdrop, "TOPRIGHT", 3, 3)
		self.Backdrop.InsideRight:SetPoint("BOTTOMRIGHT", self.Backdrop, "BOTTOMRIGHT", 3, -3)
	end

	self.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB, BackgroundAlpha)
	self.Backdrop:SetBackdropBorderColor(BackdropR, BackdropG, BackdropB)
	self.Backdrop:SetBorderColor(BorderR, BorderG, BorderB)
end

-- Credit Maximvs
API.CreateThinShadow = function(self, ShadowScale)
	if (self.Shadow) then
		return
	end

	local Level = (self:GetFrameLevel() - 1 >= 0 and self:GetFrameLevel() - 1) or (0)
	local Scale = ShadowScale or 1
	local Shadow = CreateFrame("Frame", nil, self, "BackdropTemplate")

	Shadow:SetBackdrop({edgeFile = Settings.ShadowTexture, edgeSize = Functions.Scale(4)})
	Shadow:SetFrameStrata("BACKGROUND")
	Shadow:SetFrameLevel(Level)
	Shadow:SetOutside(self, 3, 3)
	Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	Shadow:SetScale(Functions.Scale(Scale))
	
	self.Shadow = Shadow
end

-- Enable the API
Toolkit:Enable()
