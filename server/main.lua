local QBCore = exports['qb-core']:GetCoreObject()
local hasDonePreloading = {}

-- Functions

local function GiveStarterItems(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _, v in pairs(QBCore.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "Class C Driver License"
        end
        exports['pappu-inventorynp']:AddItem(src, v.item, v.amount, false, info, 'pappu-multicharacter:GiveStarterItems')
    end
end

local function loadHouseData(src)
    local HouseGarages = {}
    local Houses = {}
    local result = MySQL.query.await('SELECT * FROM houselocations', {})
    if result[1] ~= nil then
        for _, v in pairs(result) do
            local owned = false
            if tonumber(v.owned) == 1 then
                owned = true
            end
            local garage = v.garage ~= nil and json.decode(v.garage) or {}
            Houses[v.name] = {
                coords = json.decode(v.coords),
                owned = owned,
                price = v.price,
                locked = true,
                adress = v.label,
                tier = v.tier,
                garage = garage,
                decorations = {},
            }
            HouseGarages[v.name] = {
                label = v.label,
                takeVehicle = garage,
            }
        end
    end
    TriggerClientEvent("qb-garages:client:houseGarageConfig", src, HouseGarages)
    TriggerClientEvent("qb-houses:client:setHouseConfig", src, Houses)
end

-- Discord logging function
local function sendToDiscord(name, message, color)
    local discordWebhook = "https://canary.discord.com/api/webhooks/1255278139291209831/rmq4wlFMeMTEHiU1fnQ08jWhHdrJ5e4wJ7ETkBOuzm1I82w2Qi_-u57NUIO1rjUNUY_D" -- Replace with your Discord webhook URL
    
    local embeds = {
        {
            ["title"] = name,
            ["type"] = "rich",
            ["color"] = color,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Pappu MultiCharacter Logs",
            },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ") -- Adding timestamp in ISO 8601 format
        }
    }

    PerformHttpRequest(discordWebhook, 
        function(err, text, headers) 
            if err == 200 then
                print("Message sent successfully to Discord")
            else
                print("Error sending message to Discord: " .. err)
            end
        end, 
        'POST', 
        json.encode({ username = "Pappu MultiCharacter", embeds = embeds }), 
        { ['Content-Type'] = 'application/json' }
    )
end


-- Commands

QBCore.Commands.Add("logout", "Logout of Character (Admin Only)", {}, false, function(source)
    local src = source
    QBCore.Player.Logout(src)
    TriggerClientEvent('pappu-multicharacter:client:chooseChar', src)
end, "admin")

QBCore.Commands.Add("closeNUI", "Close Multi NUI", {}, false, function(source)
    local src = source
    TriggerClientEvent('pappu-multicharacter:client:closeNUI', src)
end)



-- Events

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    Wait(1000) -- 1 second should be enough to do the preloading in other resources
    hasDonePreloading[Player.PlayerData.source] = true
end)

AddEventHandler('QBCore:Server:OnPlayerUnload', function(src)
    hasDonePreloading[src] = false
end)

RegisterNetEvent('pappu-multicharacter:server:disconnect', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local citizenid = Player.PlayerData.citizenid
        local firstname = Player.PlayerData.charinfo.firstname
        local lastname = Player.PlayerData.charinfo.lastname
        local fivemname = GetPlayerName(src)
        sendToDiscord("Player Disconnected", string.format("Citizen ID: %s\nFirst Name: %s\nLast Name: %s\nFiveM Name: %s", citizenid, firstname, lastname, fivemname), 15158332)
    end
    DropPlayer(src, Lang:t("commands.droppedplayer"))
end)

RegisterNetEvent('pappu-multicharacter:server:loadUserData', function(cData)
    local src = source
    if QBCore.Player.Login(src, cData.citizenid) then
        repeat
            Wait(10)
        until hasDonePreloading[src]
        local fivemname = GetPlayerName(src)
        sendToDiscord("Player Loaded", string.format("Citizen ID: %s\nFiveM Name: %s", cData.citizenid, fivemname), 3066993)
        QBCore.Commands.Refresh(src)
        loadHouseData(src)
        if Config.SkipSelection then
            local coords = json.decode(cData.position)
            TriggerClientEvent('pappu-multicharacter:client:spawnLastLocation', src, coords, cData)
        else
            if GetResourceState('qb-apartments') == 'started' then
                TriggerClientEvent('apartments:client:setupSpawnUI', src, cData)
            else
                TriggerClientEvent('qb-spawn:client:setupSpawns', src, cData, false, nil)
                TriggerClientEvent('qb-spawn:client:openUI', src, true)
            end
        end
        TriggerEvent("qb-log:server:CreateLog", "joinleave", "Loaded", "green", "**".. GetPlayerName(src) .. "** (<@"..(QBCore.Functions.GetIdentifier(src, 'discord'):gsub("discord:", "") or "unknown").."> |  ||"  ..(QBCore.Functions.GetIdentifier(src, 'ip') or 'undefined') ..  "|| | " ..(QBCore.Functions.GetIdentifier(src, 'license') or 'undefined') .." | " ..cData.citizenid.." | "..src..") loaded..")
    end
end)

-- Ensure the resource name is correct
Citizen.CreateThread(function()
    if (GetCurrentResourceName() ~= "pappu-multicharacter") then 
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named pappu-multicharacter for it to work properly!")
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named pappu-multicharacter for it to work properly!");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named pappu-multicharacter for it to work properly!");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named pappu-multicharacter for it to work properly!");
    end
end)

-- Print resource start message
Citizen.CreateThread(function()
    local resourceName = "^2 P4ScriptsFivem Started ("..GetCurrentResourceName()..")"
    print("\n^1----------------------------------------------------------------------------------^7")
    print(resourceName)
    print("^1----------------------------------------------------------------------------------^7")
end)


RegisterNetEvent('pappu-multicharacter:server:createCharacter', function(data)
    local src = source
    local newData = {}
    newData.cid = data.cid
    newData.charinfo = data
    if QBCore.Player.Login(src, false, newData) then
        repeat
            Wait(10)
        until hasDonePreloading[src]
        local fivemname = GetPlayerName(src)
        sendToDiscord("Character Created", string.format("Citizen ID: %s\nFirst Name: %s\nLast Name: %s\nFiveM Name: %s", newData.cid, data.firstname, data.lastname, fivemname), 3066993)
        if GetResourceState('qb-apartments') == 'started' and Apartments.Starting then
            local randbucket = (GetPlayerPed(src) .. math.random(1,999))
            SetPlayerRoutingBucket(src, randbucket)
            print('^2[qb-core]^7 '..GetPlayerName(src)..' has successfully loaded!')
            QBCore.Commands.Refresh(src)
            loadHouseData(src)
            TriggerClientEvent("pappu-multicharacter:client:closeNUI", src)
            TriggerClientEvent('apartments:client:setupSpawnUI', src, newData)
            GiveStarterItems(src)
        else
            print('^2[qb-core]^7 '..GetPlayerName(src)..' has successfully loaded!')
            QBCore.Commands.Refresh(src)
            loadHouseData(src)
            TriggerClientEvent("pappu-multicharacter:client:closeNUIdefault", src)
            GiveStarterItems(src)
        end
    end
end)

RegisterNetEvent('pappu-multicharacter:server:deleteCharacter', function(citizenid)
    local src = source
    QBCore.Player.DeleteCharacter(src, citizenid)
    local fivemname = GetPlayerName(src)
    sendToDiscord("Character Deleted", string.format("Citizen ID: %s\nFiveM Name: %s", citizenid, fivemname), 15158332)
    TriggerClientEvent('QBCore:Notify', src, "Character deleted!" , "success")
end)

-- Callbacks

QBCore.Functions.CreateCallback("pappu-multicharacter:server:GetUserCharacters", function(source, cb)
    local src = source
    local license, license2 = GetPlayerIdentifierByType(src, 'license'), GetPlayerIdentifierByType(src, 'license2')
    local characters = {}
    if not license then
        cb(characters)
        return
    end
    MySQL.query('SELECT * FROM players WHERE license = ? OR license = ?', {license2, license}, function(result)
        if result[1] ~= nil then
            for _, v in pairs(result) do
                local charinfo = json.decode(v.charinfo)
                local data = {
                    citizenid = v.citizenid,
                    charinfo = charinfo,
                    cData = v
                }
                table.insert(characters, data)
            end
            cb(characters)
        else
            cb(characters)
        end
    end)
end)

QBCore.Functions.CreateCallback("pappu-multicharacter:server:GetServerLogs", function(_, cb)
    MySQL.query('SELECT * FROM server_logs', {}, function(result)
        cb(result)
    end)
end)

QBCore.Functions.CreateCallback("pappu-multicharacter:server:GetNumberOfCharacters", function(source, cb)
    local src = source
    local license, license2 = GetPlayerIdentifierByType(src, 'license'), GetPlayerIdentifierByType(src, 'license2')
    local numOfChars = 0

    if next(Config.PlayersNumberOfCharacters) then
        for _, v in pairs(Config.PlayersNumberOfCharacters) do
            if v.license == license or v.license == license2 then
                numOfChars = v.numberOfChars
                break
            else
                numOfChars = Config.DefaultNumberOfCharacters
            end
        end
    else
        numOfChars = Config.DefaultNumberOfCharacters
    end
    cb(numOfChars)
end)

QBCore.Functions.CreateCallback("pappu-multicharacter:server:setupCharacters", function(source, cb)
    local license, license2 = GetPlayerIdentifierByType(src, 'license'), GetPlayerIdentifierByType(src, 'license2')
    local plyChars = {}
    MySQL.query('SELECT * FROM players WHERE license = ? or license = ?', {license, license2}, function(result)
        for i = 1, (#result), 1 do
            result[i].charinfo = json.decode(result[i].charinfo)
            result[i].money = json.decode(result[i].money)
            result[i].job = json.decode(result[i].job)
            plyChars[#plyChars+1] = result[i]
        end
        cb(plyChars)
    end)
end)

QBCore.Functions.CreateCallback("pappu-multicharacter:server:getSkin", function(_, cb, cid)
    local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {cid, 1})
    if result[1] ~= nil then
        cb(result[1].model, result[1].skin)
    else
        cb(nil)
    end
end)