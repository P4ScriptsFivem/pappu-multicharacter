local Translations = {
    notifications = {
        ["char_deleted"] = "Personnage supprimé!",
        ["deleted_other_char"] = "Vous avez supprimé le personnage d'ID citoyen %{citizenid}.",
        ["forgot_citizenid"] = "Vous avez oublié l'ID citoyen!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Supprime le personnage d'un autre joueur",
        ["citizenid"] = "ID Citoyen",
        ["citizenid_help"] = "L'ID Citoyen du personnage que vous voulez supprimer",

        -- /logout
        ["logout_description"] = "Déconnecter du personnage (Admin Seulement)",

        -- /closeNUI
        ["closeNUI_description"] = "Fermer l'UI du multicharacter"
    },

    misc = {
        ["droppedplayer"] = "Vous avez quitté QBCore"
    },

    ui = {
        -- Main
        characters_header = "Mes personnages",
        emptyslot = "Slot vide",
        play_button = "Jouer",
        create_button = "Créer personnage",
        delete_button = "Supprimer personnage",

        -- Character Information
        charinfo_header = "Informations Personnage",
        charinfo_description = "Sélectionnez un slot pour voir toutes les informations a propos du personnage.",
        name = "Nom",
        male = "Homme",
        female = "Femme",
        firstname = "Prénom",
        lastname = "Nom",
        nationality = "Nationalité",
        gender = "Genre",
        birthdate = "Date de Naissance",
        job = "Travail",
        jobgrade = "Grade",
        cash = "Cash",
        bank = "Banque",
        phonenumber = "Numéro de téléphone",
        accountnumber = "Numéro banquaire",

        chardel_header = "Enregistrement de personnage",

        -- Delete character
        deletechar_header = "Supprimer personnage",
        deletechar_description = "Êtes vous sûr de vouloir supprimer ce personnage?",

        -- Buttons
        cancel = "Annuler",
        confirm = "Confirmer",

        -- Loading Text
        retrieving_playerdata = "Récupération des données",
        validating_playerdata = "Validation des données",
        retrieving_characters = "Récupération des personnages",
        validating_characters = "Validation des personnages",

        -- Notifications
        ran_into_issue = "Nous avons rencontré un problème",
        profanity = "Il semblerait que vous essayez d'utiliser une profanité / gros mot dans votre nom / nationalité!",
        forgotten_field = "Il semblerait que vous avez oublié de remplir un ou plusieurs champ(s)!"
    }
}

if GetConvar('qb_locale', 'en') == 'fr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
