local Translations = {
    notifications = {
        ["char_deleted"] = "Karaktären togs bort!",
        ["deleted_other_char"] = "Du tog bort karaktären med citizen id %{citizenid}.",
        ["forgot_citizenid"] = "Du glömde skriva in ett giltigt citizen id!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Raderar en karaktär",
        ["citizenid"] = "Citizen ID",
        ["citizenid_help"] = "Citizen ID:et på karaktären som du vill radera",

        -- /logout
        ["logout_description"] = "Loggar ut ur din karaktär (Admin Endast)",

        -- /closeNUI
        ["closeNUI_description"] = "Stänger ned karaktärs UI:et"
    },

    misc = {
        ["droppedplayer"] = "Du har lämnat QB-Core"
    },

    ui = {
        -- Main
        characters_header = "Mina karaktärer",
        emptyslot = "Tom karaktärsslot",
        play_button = "Spela",
        create_button = "Skapa Karaktär",
        delete_button = "Radera Karaktär",

        -- Character Information
        charinfo_header = "Karaktärs Information",
        charinfo_description = "Välj en karaktär för att se information om den.",
        name = "Namn",
        male = "Man",
        female = "Kvinna",
        firstname = "Förnamn",
        lastname = "Efternamn",
        nationality = "Nationalitet",
        gender = "Kön",
        birthdate = "Födelsedatum",
        job = "Jobb",
        jobgrade = "Jobb Rang",
        cash = "Kontanter",
        bank = "Bank",
        phonenumber = "Telefonnummer",
        accountnumber = "Kontonummer",

        chardel_header = "Karaktärs registrering",

        -- Delete character
        deletechar_header = "Radera Karaktär",
        deletechar_description = "Är du säker på att du vill ta bort din karaktär?",

        -- Buttons
        cancel = "Avbryt",
        confirm = "Bekräfta",

        -- Loading Text
        retrieving_playerdata = "Hämtar spelar data",
        validating_playerdata = "Validerar spelar data",
        retrieving_characters = "Hämtar karaktärer",
        validating_characters = "Validerar karaktärer",

        -- Notifications
        ran_into_issue = "Vi stötte på ett problem",
        profanity = "Du verkar ha försökt använda någon sorts svordom eller fult ord i ditt namn eller nationalitet!",
        forgotten_field = "Det verkar som att du glömt fylla i någon utav fälten!"
    }
}

if GetConvar('qb_locale', 'en') == 'sv' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
