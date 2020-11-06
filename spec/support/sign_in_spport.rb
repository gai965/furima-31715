module SignInSupport
  def sign_in(user)
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
  end
end