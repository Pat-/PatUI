local P, C, L, G = unpack(Tukui)

if P.myrealm == "Emerald Dream" then
	C.actionbar.hotkey = true
	C.actionbar.macro = true
end

local Frame = CreateFrame("Frame")
Frame:RegisterEvent("ADDON_LOADED")
Frame:SetScript("OnEvent", function(self, event, addon)
	if addon == "Tukui_Skins" then
		local AS = unpack(Tukui_Skins)
		
		function AS:EmbedSystem_WindowResize()
			EmbedSystem_MainWindow:ClearAllPoints()
			EmbedSystem_MainWindow:SetPoint('BOTTOM', AS.ChatBackgroundRight, 'BOTTOM', 0, 0)
			EmbedSystem_MainWindow:SetSize(AS.ChatBackgroundRight:GetWidth(), 151.5)
		end
	end
end)
