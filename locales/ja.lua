local Translations = {
    notifications = {
        ["char_deleted"] = "キャラクターを削除しました!",
        ["deleted_other_char"] = "市民ID%{citizenid}のキャラクターを削除しました!",
        ["forgot_citizenid"] = "市民IDの記入を忘れています!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "他のプレイヤーのキャラクターを削除",
        ["citizenid"] = "市民ID",
        ["citizenid_help"] = "削除する市民のID",

        -- /logout
        ["logout_description"] = "キャラクターからログアウト (管理者専用)",

        -- /closeNUI
        ["closeNUI_description"] = "マルチUIを閉じる"
    },

    misc = {
        ["droppedplayer"] = "QBCoreから切断しました。"
    },

    ui = {
        -- Main
        characters_header = "自分のキャラクター",
        emptyslot = "からのスロット",
        play_button = "遊ぶ",
        create_button = "キャラクターを作成",
        delete_button = "キャラクターを削除",

        -- Character Information
        charinfo_header = "キャラクターの情報",
        charinfo_description = "キャラクタースロットを選択して、キャラクターの情報を確認します。",
        name = "名前",
        male = "男性",
        female = "女性",
        firstname = "苗字",
        lastname = "名前",
        nationality = "出身国",
        gender = "性別",
        birthdate = "誕生日",
        job = "職業",
        jobgrade = "職業の階級",
        cash = "所持金",
        bank = "銀行口座",
        phonenumber = "携帯番号",
        accountnumber = "アカウント番号",

        chardel_header = "キャラクター登録",

        -- Delete character
        deletechar_header = "キャラクター削除",
        deletechar_description = "あなたのキャラクターを削除します。よろしいですか?",

        -- Buttons
        cancel = "キャンセル",
        confirm = "続行",

        -- Loading Text
        retrieving_playerdata = "プレイヤーデータの取得",
        validating_playerdata = "プレイヤーデータの検証",
        retrieving_characters = "キャラクターの取得",
        validating_characters = "キャラクターの検証",

        -- Notifications
        ran_into_issue = "問題が発生しました。",
        profanity = "名前、出身国に不謹慎な言葉が使用されているようです。",
        forgotten_field = "何らかの入力欄が空白のようです。"
    }
}

if GetConvar('qb_locale', 'en') == 'ja' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
