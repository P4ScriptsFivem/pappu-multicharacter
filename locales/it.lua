local Translations = {
    notifications = {
        ["char_deleted"] = "Personaggio Eliminato!",
        ["deleted_other_char"] = "Hai eliminato con successo il personaggio con Citizen ID: %{citizenid}.",
        ["forgot_citizenid"] = "Hai dimenticato di inserire il Citizen ID!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Elimina il personaggio di un altro giocatore",
        ["citizenid"] = "Citizen ID",
        ["citizenid_help"] = "Il Citizen ID del personaggio che desideri eliminare",

        -- /logout
        ["logout_description"] = "Logout (Admin Only)",

        -- /closeNUI
        ["closeNUI_description"] = "Chiudi NUI"
    },

    misc = {
        ["droppedplayer"] = "Sei stato disconnesso dal Server"
    },

    ui = {
        -- Main
        characters_header = "I miei Personaggi",
        emptyslot = "Slot Vuoto",
        play_button = "Gioca",
        create_button = "Crea Personaggio",
        delete_button = "Elimina Personaggio",

        -- Character Information
        charinfo_header = "Informazioni Personaggio",
        charinfo_description = "Seleziona uno slot per vedere tutte le informazioni sul tuo personaggio.",
        name = "Nome",
        male = "Uomo",
        female = "Donna",
        firstname = "Nome",
        lastname = "Cognome",
        nationality = "Nazionalità",
        gender = "Genere",
        birthdate = "Data di Nascita",
        job = "Lavoro",
        jobgrade = "Grado",
        cash = "Contanti",
        bank = "Banca",
        phonenumber = "Numero di Telefono",
        accountnumber = "IBAN",

        chardel_header = "Registrazione del personaggio",

        -- Delete character
        deletechar_header = "Elimina Personaggio",
        deletechar_description = "Sei sicuro di voler eliminare il tuo personaggio?",

        -- Buttons
        cancel = "Annulla",
        confirm = "Conferma",

        -- Loading Text
        retrieving_playerdata = "Recupero i dati del giocatore",
        validating_playerdata = "Convalida i dati del giocatore",
        retrieving_characters = "Recupero i dati dei personaggi",
        validating_characters = "Convalido i dati dei personaggi",

        -- Notifications
        ran_into_issue = "Abbiamo riscontrato un problema, contatta lo staff",
        profanity = "Sembra che tu stia usando qualche parola non consentita nella creazione del personaggio!",
        forgotten_field = "Tutti i campi devono essere compialti!"
    }
}

if GetConvar('qb_locale', 'en') == 'it' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
