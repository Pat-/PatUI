local C = {}

C.media = {
	datatextcolor2 = {0, .7, 1},
	pixelfont = [=[Interface\AddOns\PatUI\media\fonts\pixelfont.ttf]=],
	ru_pixelfont = [[Interface\AddOns\PatUI\media\fonts\pixel_font.ttf]],
	dmgfont = [=[Interface\AddOns\PatUI\media\fonts\font.ttf]=],
	logo = [=[Interface\AddOns\PatUI\media\textures\logo.tga]=],
	pfontsize = 10,
	ru_pfontsize = 10,
}

C.general = {
	backdropcolor = {.054, .054, .054},
	bordercolor = {.1, .1, .1},
}

C.unitframes = {
	showraidpets = false,
	unicolor = true,
	combatfeedback = false,
	cbicons = false,
	showfocustarget = false,
	
	gridhealthvertical = false,
	
	-- boss frames
	showboss = true,
	
	-- arena frames
	arena = true,
	
	-- priest only plugin
	weakendsoulbar = true,
	
	-- class bar
	classbar = true,
	
	-- these class bar are considered optional
	druidmanabar = false,
	druidmushroombar = false,
	mageclassbar = false,
	showstatuebar = false,
}

C.actionbar = {
	hotkey = false,
	macro = false,
}

C.datatext = {
	fps_ms = 2,
	system = 3,
	bags = 0,
	gold = 1,
	wowtime = 4,
	guild = 6,
	dur = 5,
	friends = 7,
	dps_text = 0,
	hps_text = 0,
	power = 0,
	haste = 0,
	crit = 0,
	avd = 0,
	armor = 0,
	currency = 0,
	hit = 0,
	mastery = 0,
	micromenu = 0,
	regen = 0,
	talent = 0,
	calltoarms = 0,
	
	time24 = false,
	localtime = true,
	battleground = false,
}

C.chat = {
	background = true,
}

C.nameplate = {
	enable = true,
    showhealth = true,
	enhancethreat = true,
}

C.classbar = {
	comboPoints = true,
}

-- make it public
TukuiEditedDefaultConfig = C