fx_version 'adamant'

game 'gta5'

server_scripts {
	'server/main.lua'
}

client_scripts {
    '@NativeUI/NativeUI.lua',
	'client/craftingmenus.lua'
}

ui_page 'html/cokecraftInfo.html'

files {
	'html/cokecraftInfo.html',
	'html/listener.js',
	'html/reset.css',
	'html/style.css',
}