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
	backdropcolor = {.08, .08, .08},
	bordercolor = {.2, .2, .2},
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
	hideshapeshift = true,
}

C.datatext = {
	fps_ms = 7,
	system = 3,
	bags = 0,
	gold = 2,
	wowtime = 1,
	guild = 6,
	dur = 4,
	friends = 5,
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
	micromenu = 8,
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
	goodcolor = { 75/255,  175/255, 76/255 },
	badcolor = { 0.78, 0.25, 0.25 },
	transitioncolor = { 218/255, 197/255, 92/255 },
}

C.classbar = {
	comboPoints = true,
}

-- make it public
TukuiEditedDefaultConfig = C