local Translations = {
    notifications = {
        ["char_deleted"] = "Postava smazána !",
        ["deleted_other_char"] = "Úspěšně jste odstranili postavu s ID občana %{citizenid}.",
        ["forgot_citizenid"] = "Zapomněli jste zadat ID občana!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Odstranění postavy jiného hráče",
        ["citizenid"] = "ID občana",
        ["citizenid_help"] = "ID občana postavy, kterou chcete odstranit.",

        -- /logout
        ["logout_description"] = "Odhlásit z postavy (Admin Only)",

        -- /closeNUI
        ["closeNUI_description"] = "Zavřít multicharakter"
    },

    misc = {
        ["droppedplayer"] = "Odpojili jste se od QBCore"
    },

    ui = {
        -- Main
        characters_header = "Moje postavy",
        emptyslot = "Prázdný slot",
        play_button = "Hrát",
        create_button = "Vytvořit postavu",
        delete_button = "Smazat postavu",

        -- Character Information
        charinfo_header = "informace o postavě",
        charinfo_description = "Výběrem slotu postavy zobrazíte všechny informace o postavě.",
        name = "Jméno",
        male = "Můž",
        female = "Žena",
        firstname = "Křestní jméno",
        lastname = "Příjmení",
        nationality = "Národnost",
        gender = "Pohlaví",
        birthdate = "Datum narození",
        job = "Práce ",
        jobgrade = "Pozice",
        cash = "Hotovost",
        bank = "Banka",
        phonenumber = "Telefoní číslo",
        accountnumber = "Číslo učtu",

        chardel_header = "Registrace postavy",

        -- Delete character
        deletechar_header = "Odstranit postavu",
        deletechar_description = "Jste si jisti, že chcete svou postavu smazat?",

        -- Buttons
        cancel = "Zrušit",
        confirm = "Potvrdit",

        -- Loading Text
        retrieving_playerdata = "Získávání údajů o hráči",
        validating_playerdata = "Ověřování údajů o hráči",
        retrieving_characters = "Získávání znaků",
        validating_characters = "Ověřování znaků",

        -- Notifications
        ran_into_issue = "Narazili jsme na problém",
        profanity = "Zdá se, že se snažíte použít nějaký druh nadávek / sprostých slov ve svém jménu nebo národnosti!",
        forgotten_field = "Zdá se, že jste zapomněli zadat jedno nebo více polí!"
    }
}

if GetConvar('qb_locale', 'en') == 'cs' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end