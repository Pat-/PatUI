local T, C, L = Tukui:unpack()

local Chat = T["Chat"]
local Bubbles = T["Chat"]["Bubbles"]
local GetAllChatBubbles = C_ChatBubbles.GetAllChatBubbles

local baseSkin = Bubbles.Skin

function Bubbles:Skin(bubble)
	baseSkin(self, bubble)

	local Bubble = bubble
	local Frame = bubble:GetChildren()

	if Frame and not Frame:IsForbidden() then
		local Scaling = UIParent:GetEffectiveScale()
		local Gap = (Scaling <= 0.60 and 20) or 10

		Frame.Backdrop:Kill()

		Frame:PatUI("Transparent", "Single")
		Frame.Backdrop:SetBackdropBorderColor(0, 0, 0)
		Frame.Backdrop:SetScale(Scaling)
		Frame.Backdrop:SetInside(Frame, Gap, Gap)

		Frame:CreateThinShadow()
		Frame.Shadow:SetOutside(Frame.Backdrop, 5, 5)
	end
end