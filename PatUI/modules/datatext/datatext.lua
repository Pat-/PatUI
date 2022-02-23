local T, C, L = Tukui:unpack()

local TukuiDT = T["DataTexts"]
local Chat = T["Chat"]

local baseEnable = TukuiDT.Enable

function TukuiDT:Enable()
	baseEnable(self)

	TukuiLeftDataTextBox:ClearAllPoints()
	TukuiLeftDataTextBox:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 22, 9)
	TukuiLeftDataTextBox:SetHeight(22)
	TukuiLeftDataTextBox:PatUI()
	TukuiLeftDataTextBox:SetFrameLevel(5)
	TukuiLeftDataTextBox.Backdrop:SetFrameStrata("BACKGROUND")

	TukuiRightDataTextBox:ClearAllPoints()
	TukuiRightDataTextBox:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -22, 9)
	TukuiRightDataTextBox:SetHeight(22)
	TukuiRightDataTextBox:PatUI()
	TukuiRightDataTextBox:SetFrameLevel(5)
	TukuiRightDataTextBox.Backdrop:SetFrameStrata("BACKGROUND")
end

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
	self.Data.Text:SetPoint("RIGHT", self, 0, 0)
	self.Data.Text:SetPoint("LEFT", self, 0, 0)
	self.Data.Text:SetPoint("TOP", self, 0, -1)
	self.Data.Text:SetPoint("BOTTOM", self, 0, -1)
	self.Data.Position = self.Num
	self.Data:SetAllPoints(self.Data.Text)
	self.Data.Text:SetFontObject(T.GetFont(C["DataTexts"].Font))
end

------------------------------------------------------------------------------------------
-- Datatexts anchors
------------------------------------------------------------------------------------------
function TukuiDT:CreateAnchors()
		local Panels = T["Panels"]

		self.NumAnchors = 6
		
	------------------------------------------------------------------------------------------	
		-- anchor frame setup
	------------------------------------------------------------------------------------------
	for i = 1, self.NumAnchors do
		local Frame = CreateFrame("Button", nil, UIParent)
		Frame:SetFrameLevel(TukuiLeftDataTextBox:GetFrameLevel() + 1)
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
			Frame:SetPoint("LEFT", TukuiLeftDataTextBox, 0, 2)
			Frame:SetSize(TukuiLeftDataTextBox:GetWidth() / 3, 24)
		elseif i == 2 then
			Frame:SetPoint("LEFT", self.Anchors[i-1], "RIGHT", 1, 0)
			Frame:SetSize(TukuiLeftDataTextBox:GetWidth() / 3, 24)
		elseif i == 3 then
			Frame:SetPoint("LEFT", self.Anchors[i-1], "RIGHT", 1, 0)
			Frame:SetSize(TukuiLeftDataTextBox:GetWidth() / 3, 24)
		elseif i == 4 then
			Frame:SetPoint("LEFT", TukuiRightDataTextBox, 0, 2)
			Frame:SetSize(TukuiRightDataTextBox:GetWidth() / 3, 24)
		elseif i == 5 then
			Frame:SetPoint("LEFT", self.Anchors[i-1], "RIGHT", 1, 0)
			Frame:SetSize(TukuiRightDataTextBox:GetWidth() / 3, 24)
		elseif i == 6 then
			Frame:SetPoint("LEFT", self.Anchors[i-1], "RIGHT", 1, 0)
			Frame:SetSize(TukuiRightDataTextBox:GetWidth() / 3, 24)
		end
	end
end

------------------------------------------------------------------------------------------
-- Datatexts tooltip anchoring
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- Defaults
------------------------------------------------------------------------------------------

local baseDT = TukuiDT.AddDefaults

function TukuiDT:AddDefaults()
	-- Call the base function first
	baseDT(self)
	
	-- Then my stuff
	TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts = {}
	
	-- Picking out our Datatexts
	TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Time"] = {true, 6}
	TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Gold"] = {true, 4}
	TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["System"] = {true, 5}
	TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Character"] = {true, 3}	
	TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Friends"] = {true, 2}
	TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Guild"] = {true, 1}
end