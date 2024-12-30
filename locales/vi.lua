local Translations = {
    notifications = {
        ["char_deleted"] = "Đã xóa nhân vật!",
        ["deleted_other_char"] = "Bạn đã xóa thành công nhân vật có số căn cước công dân %{citizenid}.",
        ["forgot_citizenid"] = "Bạn quên nhập số căn cước công dân!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Xóa nhân vật của người chơi khác",
        ["citizenid"] = "Số căn cước",
        ["citizenid_help"] = "Số căn cước của công dân muốn xóa",

        -- /logout
        ["logout_description"] = "Đăng xuất nhân vật (Admin Only)",

        -- /closeNUI
        ["closeNUI_description"] = "Close Multi NUI"
    },

    misc = {
        ["droppedplayer"] = "Bạn đã ngắt kết nối khỏi QBCore"
    },

    ui = {
        -- Main
        characters_header = "Nhân vật của tôi",
        emptyslot = "Vị trí trống",
        play_button = "Vào game",
        create_button = "Tạo nhân vật",
        delete_button = "Xóa nhân vật",

        -- Character Information
        charinfo_header = "Thông tin nhân vật",
        charinfo_description = "Chọn một vị trí ký tự để xem tất cả thông tin về nhân vật của bạn.",
        name = "Tên",
        male = "Nam",
        female = "Nữ",
        firstname = "Tên",
        lastname = "Họ",
        nationality = "Quốc gia",
        gender = "Giới tính",
        birthdate = "Ngày sinh",
        job = "Công việc",
        jobgrade = "Cấp bậc công việc",
        cash = "Tiền mặt",
        bank = "Tiền ngân hàng",
        phonenumber = "Số điện thoại",
        accountnumber = "Số tài khoản",

        chardel_header = "Đăng ký nhân vật",

        -- Delete character
        deletechar_header = "Xóa nhân vật",
        deletechar_description = "Bạn có chắc chắn muốn xóa nhân vật của mình?",

        -- Buttons
        cancel = "Hủy bỏ",
        confirm = "Xác nhận",

        -- Loading Text
        retrieving_playerdata = "Đang lấy dữ liệu",
        validating_playerdata = "Đang xác minh dữ liệu",
        retrieving_characters = "Đang lấy thông tin",
        validating_characters = "Đang xác minh thông tin",

        -- Notifications
        ran_into_issue = "Chúng tôi gặp sự cố",
        profanity = "Có vẻ như bạn đang cố gắng sử dụng một số từ ngữ tục tĩu/xấu xa trong tên hoặc quốc tịch của bạn!",
        forgotten_field = "Có vẻ như bạn đã quên nhập một hoặc nhiều trường!"
    }
}

if GetConvar('qb_locale', 'en') == 'vi' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
