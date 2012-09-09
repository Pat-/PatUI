local P, C, L, G = unpack(Tukui)

if C.bags.enable ~= true then return end

local function BagsSlotUpdate(self, b)
	local scount = _G[b.frame:GetName().."Count"]
	scount:SetFont(C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	scount:Point("BOTTOMRIGHT", 0, 2)
end
hooksecurefunc(Stuffing, "SlotUpdate", BagsSlotUpdate)

local function BagsLayout(self, lb)
	local f

	if(lb) then
		f = self.bankFrame
	else
		f = self.frame

		f.gold:SetText(GetMoneyString(GetMoney(), 12))
		f.editbox:SetFont(C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
		f.editbox:SetShadowOffset(0, 0)
		f.detail:SetFont(C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
		f.detail:SetShadowOffset(0, 0)
		f.gold:SetFont(C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
		f.gold:SetShadowOffset(0, 0)

		f.detail:ClearAllPoints()
		f.detail:Point("TOPLEFT", f, 12, -10)
		f.detail:Point("RIGHT", -(16 + 24), 0)
	end
	
	f:SetTemplate("Transparent")
	f:ThickBorder()
end
hooksecurefunc(Stuffing, "Layout", BagsLayout)

TukuiBags:ClearAllPoints()
TukuiBags:SetPoint("BOTTOMRIGHT", ChatBackground2, "TOPRIGHT", 0, 3)


local function BagsUpdateBankPosition(self, value)
	local bag = _G["Tukui"..value]
	if(value == "Bank") then
		bag:ClearAllPoints()
			bag:SetPoint("BOTTOMLEFT", ChatBackground, "TOPLEFT", 0, 3)
	end
end
hooksecurefunc(Stuffing, "CreateBagFrame", BagsUpdateBankPosition)