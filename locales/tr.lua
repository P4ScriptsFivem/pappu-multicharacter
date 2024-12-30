local Translations = {
    notifications = {
        ["char_deleted"] = "Karakter silindi!",
        ["deleted_other_char"] = "Başarıyla vatandaş kimliği %{citizenid} olan karakteri sildiniz.",
        ["forgot_citizenid"] = "Vatandaş kimliği girmeyi unuttunuz gibi görünüyor!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Başka bir oyuncunun karakterini siler",
        ["citizenid"] = "Vatandaş Kimliği",
        ["citizenid_help"] = "Silmek istediğiniz karakterin vatandaş kimliği",

        -- /logout
        ["logout_description"] = "Karakterden çıkış yap (Yalnızca Admin)",

        -- /closeNUI
        ["closeNUI_description"] = "Çoklu NUI'yi Kapat"
    },

    misc = {
        ["droppedplayer"] = "QBCore'dan çıkış yaptınız"
    },

    ui = {
        -- Ana
        characters_header = "Karakterlerim",
        emptyslot = "Boş Yuva",
        play_button = "Oyna",
        create_button = "Karakter Oluştur",
        delete_button = "Karakteri Sil",

        -- Karakter Bilgileri
        charinfo_header = "Karakter Bilgileri",
        charinfo_description = "Tüm karakter bilgilerinizi görmek için bir karakter yuvası seçin.",
        name = "Adı",
        male = "Erkek",
        female = "Kadın",
        firstname = "İsim",
        lastname = "Soyadı",
        nationality = "Uyruk",
        gender = "Cinsiyet",
        birthdate = "Doğum Tarihi",
        job = "Meslek",
        jobgrade = "Meslek Derecesi",
        cash = "Nakit",
        bank = "Banka",
        phonenumber = "Telefon Numarası",
        accountnumber = "Hesap Numarası",

        chardel_header = "Karakter Kaydı",

        -- Karakteri Sil
        deletechar_header = "Karakteri Sil",
        deletechar_description = "Karakterinizi silmek istediğinizden emin misiniz?",

        -- Düğmeler
        cancel = "İptal",
        confirm = "Onayla",

        -- Yükleniyor Metni
        retrieving_playerdata = "Oyuncu verileri alınıyor",
        validating_playerdata = "Oyuncu verileri doğrulanıyor",
        retrieving_characters = "Karakterler alınıyor",
        validating_characters = "Karakterler doğrulanıyor",

        -- Bildirimler
        ran_into_issue = "Bir sorunla karşılaştık",
        profanity = "Adınızda veya uyruğunuzda küfürlü veya kötü kelimeler kullanmaya çalışıyormuş gibi görünüyor!",
        forgotten_field = "Bir veya daha fazla alanı girmeyi unuttuğunuz gibi görünüyor!"
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
