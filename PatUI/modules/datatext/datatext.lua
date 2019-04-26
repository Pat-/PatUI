local T, C, L = Tukui:unpack()

local TukuiDT = T["DataTexts"]

------------------------------------------------------------------------------------------
-- Datatexts
------------------------------------------------------------------------------------------
local RemoveData = function(self)
	if self.Data then
		self.Data.Position = 0
		self.Data:Disable()
	end
	self.Data = nil
end

local SetData = function(self, object)
	-- Disable the old data text in use
	if self.Data then
		RemoveData(self)
	end
	-- Set the new data text
	self.Data = object
	self.Data:Enable()
	self.Data.Text:Point("RIGHT", self, 0, 0)
	self.Data.Text:Point("LEFT", self, 0, 0)
	self.Data.Text:Point("TOP", self, 0, -1)
	self.Data.Text:Point("BOTTOM", self, 0, -1)
	self.Data.Position = self.Num
	self.Data:SetAllPoints(self.Data.Text)
	self.Data.Text:SetFontObject(T.GetFont(C["DataTexts"].Font))
end

------------------------------------------------------------------------------------------
-- Datatexts anchors
------------------------------------------------------------------------------------------
function TukuiDT:CreateAnchors()
		local Panels = T["Panels"]
		local points = { DataPoint2, DataPoint3, DataPoint4, DataPoint5, DataPoint6 }

		self.NumAnchors = 6
		
	------------------------------------------------------------------------------------------	
		-- anchor frame setup
	------------------------------------------------------------------------------------------
	for i = 1, self.NumAnchors do
		local Frame = CreateFrame("Button", nil, UIParent)
		Frame:SetFrameLevel(DataPoint1:GetFrameLevel() + 1)
		Frame:SetFrameStrata("HIGH")
		Frame:EnableMouse(false)
		Frame.SetData = SetData
		Frame.RemoveData = RemoveData
		Frame.Num = i
		Frame.Tex = Frame:CreateTexture()
		Frame.Tex:SetAllPoints()
		self.Anchors[i] = Frame
		
	------------------------------------------------------------------------------------------		
			-- Setting Datatexts points
	------------------------------------------------------------------------------------------			
		if i == 1 then
			Frame:Point("CENTER", DataPoint1, 0, 2)
			Frame:Size(DataPoint1:GetWidth(), 24)
		else
			Frame:Point("CENTER", points[i-1], 0, 2)
			Frame:Size(DataPoint1:GetWidth(), 24)
		end
	end
end

------------------------------------------------------------------------------------------
-- Datatexts tooltip anchoring
------------------------------------------------------------------------------------------
local GetTooltipAnchor = function(self)
	local Position = self.Position
	local From
	local Anchor = "ANCHOR_RIGHT"
	local X = 0
	local Y = T.Scale(5)
	local Panels = T["Panels"]

------------------------------------------------------------------------------------------
	-- Basic Tooltip Anchor
------------------------------------------------------------------------------------------
	if (Position == 1) then
		Anchor = "ANCHOR_RIGHT"
		From = DataPoint1
		X = T.Scale(-DataPoint1:GetWidth()*1/6)
		Y = T.Scale(15)
	elseif (Position == 2) then
		Anchor = "ANCHOR_RIGHT"
		From = DataPoint2
		X = T.Scale(-DataPoint1:GetWidth()*1/6)
		Y = T.Scale(15)
	elseif (Position == 3) then
		Anchor = "ANCHOR_RIGHT"
		From = DataPoint3
		X = T.Scale(-DataPoint1:GetWidth()*1/6)
		Y = T.Scale(15)
	elseif (Position == 4) then
		Anchor = "ANCHOR_RIGHT"
		From = DataPoint4
		X = T.Scale(-DataPoint1:GetWidth()*1/6)
		Y = T.Scale(15)
	elseif (Position == 5) then
		Anchor = "ANCHOR_RIGHT"
		From = DataPoint5
		X = T.Scale(-DataPoint1:GetWidth()*1/6)
		Y = T.Scale(15)
	elseif (Position == 6) then
		Anchor = "ANCHOR_RIGHT"
		From = DataPoint6
		X = T.Scale(DataPoint1:GetWidth()*1/6)
		Y = T.Scale(15)
	end
	return From, Anchor, X, Y
end

-- Update the Anchor
for Name, DT in pairs(TukuiDT.Texts) do
	if DT.GetTooltipAnchor then
		DT.GetTooltipAnchor = GetTooltipAnchor
	end
end
	
------------------------------------------------------------------------------------------
-- Defaults
------------------------------------------------------------------------------------------
local baseDT = TukuiDT.AddDefaults

function TukuiDT:AddDefaults()
	-- Call the base function first
	baseDT(self)
	
	-- Then my stuff
	TukuiData[GetRealmName()][UnitName("Player")].Texts = {}
	
	-- Picking out our Datatexts
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Time] = {true, 1}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Gold] = {true, 2}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Memory] = {true, 3}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Durability] = {true, 4}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Friends] = {true, 5}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Guild] = {true, 6}
	
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.FPSAndMS] = {false, 0}	
end