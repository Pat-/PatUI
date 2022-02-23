local T, C, L = Tukui:unpack()

local ActionBars = T["ActionBars"]

local baseStopHighlight = ActionBars.StopHightlight
local baseAddHooks = ActionBars.AddHooks
local baseUpdateButton = ActionBars.UpdateButton

function ActionBars:StopHightlight()
	baseStopHighlight(self)
		
	if self.Backdrop then
		self.Backdrop:SetBorderColor(unpack(C.PatUI.BorderColor))
	end
end

function ActionBars:AddHooks()
	baseAddHooks(self)
	if C.ActionBars.ProcAnim then
		hooksecurefunc("ActionButton_HideOverlayGlow", ActionBars.StopHightlight)
	end
end

function ActionBars:UpdateButton()
	baseUpdateButton(self)

	local Action = self.action

	if C.ActionBars.EquipBorder then
		if (IsEquippedAction(Action)) then
			if self.Backdrop then
				self.Backdrop:SetBorderColor(.08, .70, 0)
			end
		else
			if self.Backdrop then
				self.Backdrop:SetBorderColor(unpack(C.PatUI.BorderColor))
			end
		end
	end
end
