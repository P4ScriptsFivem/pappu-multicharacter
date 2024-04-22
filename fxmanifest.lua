fx_version 'cerulean'
game 'gta5'

author 'pappu'
description 'pappu-multicharacter'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}
client_script 'client/main.lua'
server_scripts  {
    '@oxmysql/lib/MySQL.lua',
    '@qb-apartments/config.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    "html/js/*",
    'html/index.html',
    'html/css/*',
}

dependencies {
    'qb-core'
}
