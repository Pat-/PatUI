local P, C, L, G = unpack(Tukui)
if not C.actionbar.enable == true then return end
if C.actionbar.style ~= 2 then return end


----------------------------------------------------
-- This kind of layout is for people that don't need
-- more then one actionbar for PvE, PvP, Etc, others   
-- should use style 1 if they need more then one bar
----------------------------------------------------

local bar = TukuiBar1
bar:HookScript("OnEvent", function(self, event, unit)
	if event == "PLAYER_ENTERING_WORLD" then
		local button
		for i = 1, 12 do
			button = _G["ActionButton"..i]
			button:SetSize(P.buttonsize, P.buttonsize)
			button:ClearAllPoints()
			button:SetParent(bar)
			button:SetFrameStrata("BACKGROUND")
			button:SetFrameLevel(15)
			
			if i == 1 then
				button:Point("BOTTOMLEFT", P.buttonspacing, 0)
			elseif i == 7 then
				button:SetPoint("BOTTOMLEFT", bar, P.buttonspacing, (P.buttonsize+P.buttonspacing))
			else
				local previous = _G["ActionButton" .. i-1]
				button:SetPoint("LEFT", previous, "RIGHT", P.buttonspacing, 0)
			end
		end
	end
end)

---------------------------------
-- Set up the only actionbar here
---------------------------------
TukuiBar1:ClearAllPoints()
TukuiBar1:Point("CENTER", UIParent, "CENTER", 0, -285)
TukuiBar1:SetWidth((P.buttonsize * 6) + (P.buttonspacing * 7))
TukuiBar1:SetHeight((P.buttonsize * 2) + (P.buttonspacing * 3))
TukuiBar1:SetBackdrop(nil)
TukuiBar1:HideInsets()

---------------------------------
-- Hide Actionbar 2
---------------------------------
TukuiBar2:Size(0.001, 0.001)
TukuiBar2:SetAlpha(0)
---------------------------------
-- Hide Actionbar 3
---------------------------------
TukuiBar3:Size(0.001, 0.001)
TukuiBar3:SetAlpha(0)
---------------------------------
-- Hide Actionbar 4
---------------------------------
TukuiBar4:Size(0.001, 0.001)
TukuiBar4:SetAlpha(0)
---------------------------------
-- Hide Actionbar 5
---------------------------------
TukuiBar5:Size(0.001, 0.001)
TukuiBar5:SetAlpha(0)

---------------------------------
-- Hide Actionbar4 Button
---------------------------------
TukuiBar4Button:Size(0.001, 0.001)
TukuiBar4Button:SetAlpha(0)
---------------------------------
-- Hide Actionbar3 Button
---------------------------------
TukuiBar3Button:Size(0.001, 0.001)
TukuiBar3Button:SetAlpha(0)
---------------------------------
-- Hide Actionbar2 Button
---------------------------------
TukuiBar2Button:Size(0.001, 0.001)
TukuiBar2Button:SetAlpha(0)
---------------------------------
--  Hide Actionbar5 Buttons
---------------------------------
TukuiBar5ButtonTop:Size(0.001, 0.001)
TukuiBar5ButtonTop:SetAlpha(0)
TukuiBar5ButtonBottom:Size(0.001, 0.001)
TukuiBar5ButtonBottom:SetAlpha(0)
