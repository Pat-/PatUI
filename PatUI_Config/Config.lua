local C = {}

C.media = {
	datatextcolor2 = {0, .7, 1},
	pixelfont = [=[Interface\AddOns\PatUI\media\fonts\pixelfont.ttf]=],
	ru_pixelfont = [[Interface\AddOns\PatUI\media\fonts\pixel_font.ttf]],
	dmgfont = [=[Interface\AddOns\PatUI\media\fonts\font.ttf]=],
	pfontsize = 12,
	ru_pfontsize = 10,
}

C.general = {
	backdropcolor = {.05, .05, .05},
	bordercolor = {.15, .15, .15},
}

C.actionbar = {
	hotkey = false,
}

C.auras = {
	consolidate = false,
}

C.unitframes = {	
    unicolor = true,
	targetpowerpvponly = false,
	cbicons = false,
	combatfeedback = false,
	showplayerinparty = true,
	showfocustarget = false,
	cblatency = true,
	druidmanabar = false,
	druidmushroombar = false,
}

C.nameplate = {
    showhealth = true,
	enhancethreat = true,
}

C.datatext = {
	fps_ms = 0,
	system = 0,
	bags = 0,
	gold = 6,
	wowtime = 1,
	guild = 5,
	dur = 4,
	friends = 3,
	dps_text = 0,
	hps_text = 0,
	power = 2,
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

C.classbar = {
	comboPoints = true,
}

-- make it public
TukuiEditedDefaultConfig = C
