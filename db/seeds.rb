user = User.create!(email: "admin@example.jp",
    password:  "abcd1234",
    password_confirmation: "abcd1234",
    nickname:  "管理者",
    role: 1)