module LoginModule
    def login(user)
      visit login_path  #visit 特定のurlにアクセスする。
      fill_in 'email', with: user.email #fill_in ‘ラベル内容’, with: ‘入力内容’
      fill_in 'password', with: 'password' #fill_in ‘ラベル内容’, with: ‘入力内容’
      click_button 'ログイン' #「ボタン名」というvalueの値をクリックする
    end
  end