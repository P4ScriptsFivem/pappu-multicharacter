# Pappu-Multicharacter
Multi Character Feature for QBCore Multicharacter And inspired by NoPixel 4.0. 

## Features
- Ability To Create Max 4 Characters.
- Ability Delete Any Character.
- Ability To See Character Information During Selection.
- Ability To Customise Your Character Slot At [config.lua](https://github.com/P4ScriptsFivem/pappu-multicharacter/blob/main/config.lua).
- **New**: Ability to log character creation, deletion, and selection to a Discord [webhook](https://github.com/P4ScriptsFivem/pappu-multicharacter/blob/main/server/main.lua#L61).
## Preview
![Group 5765](https://github.com/P4ScriptsFivem/pappu-multicharacter/assets/120780563/904aa0c6-cabf-4b9a-82ca-ac224e5cc24b)


## Features
If You Use [qb-houses](https://github.com/qbcore-framework/qb-houses)
Go To Line 324 in Server/main.lua [here](https://github.com/qbcore-framework/qb-houses/blob/main/server/main.lua)

Remove This 
```
    TriggerClientEvent('qb-multicharacter:client:chooseChar', src)
```
Add This  
```
    TriggerClientEvent('pappu-multicharacter:client:chooseChar', src)
```

## Screenshots
![Group 847](https://github.com/P4ScriptsFivem/pappu-multicharacter/assets/120780563/9d7d768b-799f-4dfe-9567-62077479db63)


## Installation
### Manual
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg

```
ensure qb-core
ensure pappu-multicharacter
ensure qb-spawn
ensure qb-apartments
ensure qb-clothing
ensure qb-weathersync
```

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-spawn](https://github.com/qbcore-framework/qb-spawn) - Spawn selector
- [qb-apartments](https://github.com/qbcore-framework/qb-apartments) - For giving the player a apartment after creating a character.
- [qb-clothing](https://github.com/qbcore-framework/qb-clothing) - For the character creation and saving outfits.
- [qb-weathersync](https://github.com/qbcore-framework/qb-weathersync) - For adjusting the weather while player is creating a character.

## Credits & Original Repository
- [qb-multicharacter](https://github.com/qbcore-framework/qb-multicharacter)
  
## License
[GPL-3.0 license](LICENSE)
