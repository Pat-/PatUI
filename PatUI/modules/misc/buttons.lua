local P, C, L, G = unpack(Tukui)

-----------------------
-- Create Buttons here
-----------------------

-- Toggle Mininmap Button
local mmb = CreateFrame("Frame", "Minimap_Button", ControlPanelBackground)
mmb:SetTemplate("Transparent")
mmb:Size(70, 13)
mmb:Point("LEFT", ControlPanelBackground, "LEFT", 4, -34)
mmb:SetFrameStrata("BACKGROUND")

mmb:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
mmb.Text:Point("CENTER", Minimap_Button)
mmb.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Hide Minimap")

-- Toggle Chat button
local cb = CreateFrame("Frame", "chat_Button", ControlPanelBackground)
cb:SetTemplate("Transparent")
cb:Size(70, 13)
cb:Point("LEFT", ControlPanelBackground, "LEFT", 4, -17)
cb:SetFrameStrata("BACKGROUND")

cb:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
cb.Text:Point("CENTER", chat_Button)
cb.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Hide Chat")

-- ReloadUI Button
local rlb = CreateFrame("Button", "Reload_Button", ControlPanelBackground, "SecureActionButtonTemplate")
rlb:SetTemplate("Transparent")
rlb:Size(70, 13) 
rlb:Point("LEFT", ControlPanelBackground, "LEFT", 4, 0)
rlb:SetAttribute("type", "macro")
rlb:SetAttribute("macrotext", "/rl")

rlb:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
rlb.Text:Point("CENTER", Reload_Button)
rlb.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Reload")

-- iFilger Button
local ifb = CreateFrame("Button", "iFilger_Button", ControlPanelBackground, "SecureActionButtonTemplate")
ifb:SetTemplate("Transparent")
ifb:Size(70, 13) 
ifb:Point("LEFT", ControlPanelBackground, "LEFT", 4, 16)
ifb:SetAttribute("type", "macro")
ifb:SetAttribute("macrotext", "/ifilger")

ifb:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
ifb.Text:Point("CENTER", iFilger_Button)
ifb.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."iFilger")

-- moveui button
local muib = CreateFrame("Button", "MoveUI_Button", ControlPanelBackground, "SecureActionButtonTemplate")
muib:SetTemplate("Transparent")
muib:Size(70, 13) 
muib:Point("LEFT", ControlPanelBackground, "LEFT", 4, 33)
muib:SetAttribute("type", "macro")
muib:SetAttribute("macrotext", "/moveui")

muib:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
muib.Text:Point("CENTER", MoveUI_Button)
muib.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."MoveUI")

-- resetui button
local ib = CreateFrame("Button", "Install_Button", ControlPanelBackground, "SecureActionButtonTemplate")
ib:SetTemplate("Transparent")
ib:Size(70, 13) 
ib:Point("RIGHT", ControlPanelBackground, "RIGHT", -4, 33)
ib:SetAttribute("type", "macro")
ib:SetAttribute("macrotext", "/resetui")

ib:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
ib.Text:Point("CENTER", Install_Button)
ib.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Install")

-------------------------------------------------------------------
-- Create Filler Buttons until I have time to think of more buttons
-------------------------------------------------------------------

local fb3 = CreateFrame("Button", "Filler_Button3", ControlPanelBackground, "SecureActionButtonTemplate")
fb3:SetTemplate("Transparent")
fb3:Size(70, 13) 
fb3:Point("RIGHT", ControlPanelBackground, "RIGHT", -4, 16)

fb3:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
fb3.Text:Point("CENTER", Filler_Button3)
fb3.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Filler")

local fb4 = CreateFrame("Button", "Filler_Button4", ControlPanelBackground, "SecureActionButtonTemplate")
fb4:SetTemplate("Transparent")
fb4:Size(70, 13) 
fb4:Point("RIGHT", ControlPanelBackground, "RIGHT", -4, 0)

fb4:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
fb4.Text:Point("CENTER", Filler_Button4)
fb4.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Filler")

local fb5 = CreateFrame("Button", "Filler_Button5", ControlPanelBackground, "SecureActionButtonTemplate")
fb5:SetTemplate("Transparent")
fb5:Size(70, 13) 
fb5:Point("RIGHT", ControlPanelBackground, "RIGHT", -4, -17)

fb5:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
fb5.Text:Point("CENTER", Filler_Button5)
fb5.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Filler")

local fb6 = CreateFrame("Button", "Filler_Button6", ControlPanelBackground, "SecureActionButtonTemplate")
fb6:SetTemplate("Transparent")
fb6:Size(70, 13) 
fb6:Point("RIGHT", ControlPanelBackground, "RIGHT", -4, -34)

fb6:FontString("Text", C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
fb6.Text:Point("CENTER", Filler_Button6)
fb6.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."Filler")