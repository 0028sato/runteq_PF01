require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力りが正常' do
        it 'ユーザーの新規作成が成功する' do
          visit new_user_path
          fill_in 'ニックネーム', with: 'test_name'
          fill_in 'メールアドレス', with: 'test_email@email.com'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録が完了しました'
          expect(current_path).to eq login_path
        end
      end

      context 'ニックネームが未入力' do
        it 'ユーザーの新規作成に失敗する' do
          visit new_user_path
          fill_in 'ニックネーム', with: ''
          fill_in 'メールアドレス', with: 'test_email@email.com'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'ニックネームを入力してください'
          expect(current_path).to eq users_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規作成に失敗する' do
          visit new_user_path
          fill_in 'ニックネーム', with: 'test_name'
          fill_in 'メールアドレス', with: ''
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'メールアドレスを入力してください'
          expect(current_path).to eq users_path
        end
      end

      context 'パスワードが未入力、3文字以下' do
        it 'ユーザーの新規作成に失敗する' do
          visit new_user_path
          fill_in 'ニックネーム', with: 'test_name'
          fill_in 'メールアドレス', with: 'test_email@email.com'
          fill_in 'パスワード', with: ''
          fill_in 'パスワード確認', with: ''
          click_button '登録'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'パスワードは3文字以上で入力してください'
          expect(page).to have_content 'パスワード確認を入力してください'
          expect(current_path).to eq users_path
        end
      end

      context '登録済みのメールアドレスを使用する' do
        it 'ユーザーの新規作成に失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in 'ニックネーム', with: 'test_name'
          fill_in 'メールアドレス', with: existed_user.email
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'メールアドレスはすでに存在します'
          expect(current_path).to eq users_path
        end
      end
    end

    describe 'マイページ、投稿作成' do
      context 'ログインしていない状態' do
        it 'マイページメニューと投稿作成が表示されない' do
          visit root_path
          expect(page).not_to have_content('マイページ')
          expect(page).not_to have_content('投稿作成')
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login(user) }
  
    describe 'ユーザー編集' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの編集が成功する' do
          visit root_path
          find(".mypage-toggle").click
          click_link 'プロフィール'
          click_link '編集'
          fill_in 'メールアドレス', with: 'test_edit@email.com'
          fill_in 'ニックネーム', with: 'test_edit_name'
          select '男性', from: '性別'
          select '10代', from: '年齢'
          click_button '更新する'
          expect(page).to have_content('ユーザーを更新しました')
          expect(current_path).to eq profile_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの編集が失敗する' do
          visit root_path
          find(".mypage-toggle").click
          click_link 'プロフィール'
          click_link '編集'
          fill_in 'メールアドレス', with: ''
          fill_in 'ニックネーム', with: 'test_edit_name'
          select '男性', from: '性別'
          select '10代', from: '年齢'
          click_button '更新する'
          expect(page).to have_content('ユーザーを更新できませんでした')
          expect(page).to have_content('メールアドレスを入力してください')
          expect(current_path).to eq profile_path
        end
      end

      context '登録済みのメールアドレスを使用' do
        it 'ユーザーの編集が失敗する' do
          visit root_path
          other_user = create(:user)
          find(".mypage-toggle").click
          click_link 'プロフィール'
          click_link '編集'
          fill_in 'メールアドレス', with: other_user.email
          fill_in 'ニックネーム', with: 'test_edit_name'
          select '男性', from: '性別'
          select '10代', from: '年齢'
          click_button '更新する'
          expect(page).to have_content('ユーザーを更新できませんでした')
          expect(page).to have_content('メールアドレスはすでに存在します')
          expect(current_path).to eq profile_path
        end
      end
    end
  end
end
