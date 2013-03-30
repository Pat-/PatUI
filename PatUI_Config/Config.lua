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
	autoscale = true,
	uiscale = 0.71,
	overridelowtohigh = false,
	backdropcolor = {.054, .054, .054},
	bordercolor = {.1, .1, .1},
	blizzardreskin = true,
}

C.unitframes = {
	-- general options	
	enable = true,
	enemyhcolor = false,
	unitcastbar = true,
	cblatency = true,
	cbicons = false,
	classiccombo = false,
	movecombobar = false,
	auratimer = true,
	auratextscale = 11,
	targetauras = true,
	lowThreshold = 20,
	targetpowerpvponly = false,
	totdebuffs = false,
	showtotalhpmp = false,
	showsmooth = true,
	charportrait = false,
	maintank = false,
	mainassist = false,
	unicolor = true,
	combatfeedback = false,
	playeraggro = true,
	healcomm = false,
	onlyselfdebuffs = false,
	showfocustarget = false,
	bordercolor = {.15, .15, .15},
	
	-- raid layout
	raid = true,
	showrange = true,
	raidalphaoor = 0.3,
	showsymbols = true,
	aggro = true,
	raidunitdebuffwatch = true,
	gridhealthvertical = true,
	gridscale = 1,
	gridvertical = true,
	raidunitspercolumn = 10,
	showraidpets = true,
	maxraidplayers = false,
	
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
	mageclassbar = true,
	showstatuebar = false,
}

C.auras = {
	player = true,
	consolidate = false,
	flash = false,
	classictimer = false,
}

C.actionbar = {
	enable = true,
	hotkey = false,
	macro = false,
	hideshapeshift = false,
	buttonsize = 27,
	petbuttonsize = 27,
	buttonspacing = 4,
	ownshdbar = false,
	ownmetabar = false,
	ownwarstancebar = false,
}

C.bags = {
	enable = true,
}

C.loot = {
	lootframe = true,
	rolllootframe = true,
}

C.cooldown = {
	enable = true,
	treshold = 8,
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
	enable = true,
	whispersound = false,
	background = true,
}

C.nameplate = {
	enable = true,
    showhealth = true,
	enhancethreat = true,
	combat = false,
	goodcolor = { 75/255,  175/255, 76/255 },
	badcolor = { 0.78, 0.25, 0.25 },
	transitioncolor = { 218/255, 197/255, 92/255 },
}

C.tooltip = {
	enable = true,
	hidecombat = false,
	hidebuttons = false,
	hideuf = false,
	cursor = false,
}

C.merchant = {
	sellgrays = true,
	autorepair = true,
	sellmisc = true,
}

C.error = {
	enable = true,
}

C.invite = {
	autoaccept = true,
}

C.classbar = {
	comboPoints = true,
}

-- make it public
TukuiEditedDefaultConfig = C