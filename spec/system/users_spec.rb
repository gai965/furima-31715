require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'トップページ' do
    it 'ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されること' do
      # トップページに遷移する
      visit root_path
      # トップページに新規登録ボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # トップページにログインボタンがあることを確認する
      expect(page).to have_content('ログイン')
    end

    it 'ログイン状態では、ヘッダーにユーザーのニックネーム/ログアウトボタンが表示されること' do
      # トップページに遷移する
      visit root_path
      # 新規登録ボタンを押す
      click_on '新規登録'
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password
      fill_in 'last-name', with: @user.lastname
      fill_in 'first-name', with: @user.firstname
      fill_in 'last-name-kana', with: @user.lastname_kana
      fill_in 'first-name-kana', with: @user.firstname_kana
      find('#user_birth_date_1i').find("option[value='1930']").select_option
      find('#user_birth_date_2i').find("option[value='6']").select_option
      find('#user_birth_date_3i').find("option[value='19']").select_option
      # 会員登録ボタンを押す
      click_on '会員登録'
      # 現在のページがtopページなのか確認
      expect(current_path).to eq root_path
      # ログアウトボタンが表示されることを確認
      expect(page).to have_content('ログアウト')
      # ユーザーのニックネームが表示されているか確認
      expect(page).to have_content(@user.nickname)
    end

    it 'ヘッダーの新規登録/ログインボタンをクリックすることで、各ページに遷移できること' do
      # トップページに遷移する
      visit root_path
      # 新規登録ボタンを押す
      click_on '新規登録'
      # 現在のページが「新規登録」ページなのか確認
      expect(current_path).to eq new_user_registration_path
      # トップページに遷移する
      visit root_path
      # 新規登録ボタンを押す
      click_on 'ログイン'
      # 現在のページが「ログイン」ページなのか確認
      expect(current_path).to eq new_user_session_path
    end

    it 'ヘッダーのログアウトボタンをクリックすることで、ログアウトができること' do
      # トップページに遷移する
      visit root_path
      # 新規登録ボタンを押す
      click_on '新規登録'
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password
      fill_in 'last-name', with: @user.lastname
      fill_in 'first-name', with: @user.firstname
      fill_in 'last-name-kana', with: @user.lastname_kana
      fill_in 'first-name-kana', with: @user.firstname_kana
      find('#user_birth_date_1i').find("option[value='1930']").select_option
      find('#user_birth_date_2i').find("option[value='6']").select_option
      find('#user_birth_date_3i').find("option[value='19']").select_option
      # 会員登録ボタンを押す
      click_on '会員登録'
      # ログアウトボタンが表示されることを確認
      expect(page).to have_content('ログアウト')
      # ログアウトボタンを押す
      click_on 'ログアウト'
      # 現在のページにログインボタンがあることを確認する
      expect(page).to have_content('ログイン')
    end
  end
end
