local Translations = {
    notifications = {
        ["char_deleted"] = "Karakter verwijderd!",
        ["deleted_other_char"] = "Je hebt het personage met citizen id %{citizenid} met succes verwijderd.",
        ["forgot_citizenid"] = "Je vergat een citizen id in te vullen!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Verwijdert een ander personage",
        ["citizenid"] = "Citizen ID",
        ["citizenid_help"] = "Het Citizen ID van het personage dat je wilt verwijderen",

        -- /logout
        ["logout_description"] = "Uitloggen van karakter (alleen admin)",

        -- /closeNUI
        ["closeNUI_description"] = "Sluit Multi NUI"
    },

    misc = {
        ["droppedplayer"] = "U bent weggegaan van BrusselRP"
    },

    ui = {
        -- Main
        characters_header = "Mijn karakters",
        emptyslot = "Leeg slot",
        play_button = "Speel",
        create_button = "Maak karakter",
        delete_button = "Verwijder karakter",

        -- Character Information
        charinfo_header = "Karakterinformatie",
        charinfo_description = "Selecteer een karakter om alle informatie over dat personage te zien.",
        name = "Naam",
        male = "Man",
        female = "Vrouw",
        firstname = "Voornaam",
        lastname = "Achternaam",
        nationality = "Nationaliteit",
        gender = "Geslacht",
        birthdate = "Geboortedatum",
        job = "Job",
        jobgrade = "Job Graad",
        cash = "Contant",
        bank = "Bank",
        phonenumber = "Telefoonnummer",
        accountnumber = "Accountnummer",

        chardel_header = "Karakterregistratie",

        -- Delete character
        deletechar_header = "Verwijder karakter",
        deletechar_description = "Weet je zeker dat je dit personage wilt verwijderen?",

        -- Buttons
        cancel = "Annuleer",
        confirm = "Bevestig",

        -- Loading Text
        retrieving_playerdata = "Spelergegevens ophalen",
        validating_playerdata = "Gegevens valideren",
        retrieving_characters = "Ophalen van personages",
        validating_characters = "Karakters valideren",

        -- Notifications
        ran_into_issue = "We kwamen een probleem tegen (report dit aub)",
        profanity = "Het lijkt erop dat u probeert een soort godslastering / slechte woorden in uw naam of nationaliteit te gebruiken!",
        forgotten_field = "Het lijkt erop dat je bent vergeten een of meerdere van de velden in te voeren!"
    }
}

if GetConvar('qb_locale', 'en') == 'nl' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
