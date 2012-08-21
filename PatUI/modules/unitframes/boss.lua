-- Tainting UI commiting out until can figure out why.
local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.unitframes.enable ~= true then return end
local font1 = C.media.pixelfont

-- Bosses
for i = 1, MAX_BOSS_FRAMES do
	local frame = _G["TukuiBoss"..i]
end