local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.unitframes.enable ~= true then return end
local font1 = C.media.pixelfont

-- Arena
for i = 1, 5 do
	local frame = _G["TukuiArena"..i]
end