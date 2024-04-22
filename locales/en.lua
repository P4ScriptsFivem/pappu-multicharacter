local Translations = {
    ui = {
        -- Main
        male = "Male",
        female = "Female",
        error_title = "Error!",
        characters_header = "Character Selector",
        characters_count = "characters",
      
         --Setup Characters
       default_image = 'https://cdn.discordapp.com/attachments/1231930300628471878/1231938611759546428/multi.gif?ex=6638c73d&is=6626523d&hm=5ca0b23a3e41131d1d2a95352e57df746d014d4f36906a56d9032b2e13c8cc55&', --You can 'assets/yourimage.png' or any put "any link you want"
       create_new_character = "Create new character",
       default_right_image = 'https://cdn.discordapp.com/attachments/1231930300628471878/1231942815823695942/action_key.png?ex=6627a7a7&is=66265627&hm=e14faf70483ecc96cf83f52d2b2adb2aa474b86f44f5f63566f67dcbb5719ef4&',

        --Create character
        create_header = "Identity Creation",
        header_detail = "Enter your character detalls",
        gender_marker = "Gender Marker",
        
        missing_information = "You wrote missing information.",
        badword = "You have used a bad word, try again!",
       
        create_firstname = "Name",
        create_lastname = "Lastname",
        create_nationality = "Nationality",
        create_birthday = "Birthday",

        -- Buttons
        select = "Select",
        create = "Create",
        spawn = "Spawn",
        delete = "Delete",
        cancel = "Cancel",
        confirm = "Confirm",
        close = "Close",
    },

    notifications = {
        ["char_deleted"] = "Character deleted!",
        ["deleted_other_char"] = "You successfully deleted the character with citizen id %{citizenid}.",
        ["forgot_citizenid"] = "You forgot to input a citizen id!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Deletes another players character",
        ["citizenid"] = "Citizen ID",
        ["citizenid_help"] = "The Citizen ID of the character you want to delete",

        --Loaded
       
        -- /logout
        ["logout_description"] = "Logout of Character (Admin Only)",

        -- /closeNUI
        ["closeNUI_description"] = "Close Multi NUI"
    },

    misc = {
        ["succes_loaded"] = '^2[qb-core]^7 %{value} has succesfully loaded!',
        ["droppedplayer"] = "You have disconnected from QBCore"
    },


}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
