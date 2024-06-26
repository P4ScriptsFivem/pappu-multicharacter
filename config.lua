Config = {}
Config.Interior = vector3(-1004.36, -477.9, 51.63) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1004.36, -477.9, 51.63) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(-1008.49, -474.51, 50.03, 208.64) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(-1001.11, -478.06, 50.03, 24.55) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(-1005.53, -480.73, 50.52, 27.44) -- Camera coordinates for character preview screen
Config.EnableDeleteButton = false -- Define if the player can delete the character or not

Config.DefaultNumberOfCharacters = 2 --  Max 4 // Dont Go More Than 4
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", numberOfChars = 2 },
}

Config.cinematiclocation = {
    [1] = vector4(-1007.53, -480.73, 50.22, 15.44), --start
    [2] = vector4(-1007.53, -479.14, 50.52, 15.44), --start left to right
    [3] = vector4(-1004.53, -477.33, 50.52, 75.44),  --stop right
    [4] = vector4(-1006.53, -473.53, 50.52, 135.00),  --move other way and right to left
    [5] = vector4(-1011.03, -476.33, 50.52, 275.00),  --stop left
}