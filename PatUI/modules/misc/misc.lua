local T, C, L = Tukui:unpack()

-- first make sure AddOnSkins is loaded
if not (IsAddOnLoaded("AddOnSkins")) then return end

-- Unpack AddOnSkins Engine to use after the check that AddOnSkins is loaded
local AS = unpack(AddOnSkins)

if AS:CheckOption('Theme') == 'ThickBorder' then
	-- setting this so that with AddonSkins Thick Border theme it isn't using the default Tukui BorderColor of (0, 0, 0)
	function AS:UpdateMedia()
		AS.BorderColor = C['PatUI']['BorderColor']
	end
end