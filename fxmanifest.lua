fx_version "cerulean"
game "gta5"

author "Gege"
description "Purge-style in-game event!"

lua54 "yes"

shared_scripts {
    "@ox_lib/init.lua",
    "config.lua"
}
client_scripts {
    "client/*.lua"
}
server_scripts {
    "server/*.lua"
}
ui_page "sound/index.html"

files {
    "sound/purge.ogg",
    "sound/index.html"
}
