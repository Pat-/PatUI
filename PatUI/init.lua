local T, C, L = Tukui:unpack()

local Toons = {
  ["Patqt-Mankrik"] = true,
  ["Patlol-Mankrik"] = true,
  ["Maydie-Mankrik"] = true,
  ["Akirios-Mankrik"] = true,
  ["Teller-Mankrik"] = true
}

IsPat = setmetatable( Toons, {
   __call = function(self, unit)
      return self[unit..'-'..GetRealmName()]
   end
})