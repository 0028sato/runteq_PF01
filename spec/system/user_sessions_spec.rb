require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する' do
        login(user)
        expect(page).to have_content "ログインしました"
        expect(current_path).to eq root_path
      end
    end
    context 'フォームが未入力' do
      it 'ログインに失敗する' do
        visit login_path
        fill_in 'email', with: nil
        fill_in 'password', with: nil
        click_button 'ログイン'
        expect(page).to have_content "ログインに失敗しました"
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウト処理が成功する' do
        login(user)
        find(".mypage-toggle").click
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
        expect(current_path).to eq root_path
      end
    end
  end
end
