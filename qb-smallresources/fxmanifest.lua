fx_version 'adamant'

game 'gta5'

server_scripts {
	"server/main.lua",
	"server/trunk.lua",
	"server/consumables.lua",
	"server/hostage.lua",
	"config.lua",
}

client_scripts {
	"config.lua",
	"client/main.lua",
	"client/fireworks.lua",
	"client/binoculars.lua",
	"client/ignore.lua",
	"client/density.lua",
	"client/weapdraw.lua",
	"client/hudcomponents.lua",
	"client/cruise.lua",
	"client/recoil.lua",
	"client/removeentities.lua",
	"client/crouchprone.lua",
	"client/consumables.lua",
	"client/discord.lua",
	"client/point.lua",
	'client/engine.lua',
	"client/calmai.lua",
	"client/teleports.lua",
	"client/nos.lua",
	"client/hostage.lua",
	"client/scaleform.lua",
}

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
	'events.meta',
	'popgroups.ymt',
	'relationships.dat',
}

exports {
	'HasHarness'
}