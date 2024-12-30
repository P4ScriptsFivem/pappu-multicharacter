local Translations = {
    notifications = {
        ["char_deleted"] = "تم حذف الشخصية!",
        ["deleted_other_char"] = "لقد قمت بحذف الشخصية رقم الايدي  %{citizenid}.",
        ["forgot_citizenid"] = "لقد نسيت ادخال رقم الايدي الخاص بالشخصية citizenid!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "حذف شخصية لاعب آخر",
        ["citizenid"] = "ايدي الشخصية",
        ["citizenid_help"] = "ايدي الشخصية للاعب الذي تريد حذف شخصيته",

        -- /logout
        ["logout_description"] = "تسجيل خروج الشخصية (Admin Only)",

        -- /closeNUI
        ["closeNUI_description"] = "إغلاق النوافذ المتعددة"
    },

    misc = {
        ["droppedplayer"] = "انقطع الاتصال مع السيرفر"
    },

    ui = {
        -- Main
        characters_header = "شخصياتي",
        emptyslot = "فارغة",
        play_button = "إبدا",
        create_button = "إنشاء شخصية",
        delete_button = "حذف شخصية",

        -- Character Information
        charinfo_header = "معلومات الشخصية",
        charinfo_description = "اختر الشخصية لترى جميع المعلومات المتعلقة بهته الشخصية.",
        name = "الإسم",
        male = "رجل",
        female = "إمرأة",
        firstname = "الإسم الأول",
        lastname = "اسم العائلة",
        nationality = "الجنسية",
        gender = "الجنس",
        birthdate = "الميلاد",
        job = "الوظيفة",
        jobgrade = "رتبة الوظيفة",
        cash = "الأموال",
        bank = "اموال البنك",
        phonenumber = "رقم الهاتف",
        accountnumber = "رقم الحساب",

        chardel_header = "تسجيل سخصية",

        -- Delete character
        deletechar_header = "حذف شخصية",
        deletechar_description = "هل أنت متاكد من حذفك للشخصية?",

        -- Buttons
        cancel = "الغاء",
        confirm = "تاكيد",

        -- Loading Text
        retrieving_playerdata = "جلب معلومات اللاعب",
        validating_playerdata = "تأكيد معلومات اللاعب",
        retrieving_characters = "جلب الشخصيات",
        validating_characters = "تاكيد الشخصيات",

        -- Notifications
        ran_into_issue = "واجهتنا مشكلة",
        profanity = "يبدو انك تحاول استخدام اسم غير لائق في اسمك او جنسيتك حاول مرة اخرى!",
        forgotten_field = "يبدو أنك نسيت ادخال بعض المعلومات تحقق مرة اخرى!"
    }
}

if GetConvar('qb_locale', 'en') == 'ar' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
