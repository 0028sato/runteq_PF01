require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  describe 'ログイン前' do
    describe 'ページ遷移確認' do
      context 'postの新規投稿ページにアクセス' do
        it '新規登録ページへのアクセスに失敗する' do
          visit new_post_path
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end

      context 'postの編集ページにアクセス' do
        it '編集ページへのアクセスに失敗する' do
          visit edit_post_path(post)
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end

      context '投稿の一覧ページにアクセス' do
        it '投稿一覧ページにアクセスできる' do
          visit root_path
          expect(current_path).to eq root_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login(user) }

    describe '投稿の新規作成' do
      context 'フォームの入力値が正常' do
        it '投稿の新規作成に成功する' do
          visit new_post_path
          fill_in 'Board Name', with: 'test_board_name'
          fill_in 'Board Information', with: 'test_board_information'
          fill_in 'Binding Name', with: 'test_binding_name'
          fill_in 'Binding Information', with: 'test_binding_information'
          fill_in 'Boots Name', with: 'test_boots_name'
          fill_in 'Boots Information', with: 'test_boots_information'
          fill_in 'カスタム費用(合計)', with: 12345
          fill_in '本文', with: 'test_body'
          click_button '登録する'
          expect(page).to have_content '投稿しました'
          expect(current_path).to eq root_path
        end
      end

      context '投稿の詳細ページにアクセス' do
        it '投稿詳細ページにアクセスできる' do
          visit new_post_path
          fill_in 'Board Name', with: 'test_board_name'
          fill_in 'Board Information', with: 'test_board_information'
          fill_in 'Binding Name', with: 'test_binding_name'
          fill_in 'Binding Information', with: 'test_binding_information'
          fill_in 'Boots Name', with: 'test_boots_name'
          fill_in 'Boots Information', with: 'test_boots_information'
          fill_in 'カスタム費用(合計)', with: 12345
          fill_in '本文', with: 'test_body'
          click_button '登録する'
          click_link '詳細'
          expect(page).to have_content('詳細画面')
          expect(post_path(post)).to eq post_path(post)
        end
      end
    end
  end
end
