require 'rails_helper'

RSpec.describe "Products", type: :system do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('app/assets/images/test/test.png')
    @user = FactoryBot.build(:user)
  end
  
  describe '商品出品' do
    context 'ログイン時の作業' do
      it '商品出品ができることを確認' do
        # サインインする
        sign_in(@user)
        # 「出品する」ボタンを押す
        click_on '出品する'
        # 現在のページが商品情報入力ページなのか確認
        expect(current_path).to eq new_product_path
        # 商品情報を入力する
        attach_file('product[image]', 'app/assets/images/test/test.png')
        fill_in 'item-name', with: @product.name
        fill_in 'item-info', with: @product.explanation
        find('#item-category').find("option[value='1']").select_option
        find('#item-sales-status').find("option[value='1']").select_option
        find('#item-shipping-fee-status').find("option[value='1']").select_option
        find('#item-prefecture').find("option[value='1']").select_option
        find('#item-scheduled-delivery').find("option[value='1']").select_option
        fill_in 'item-price', with: @product.price
        # 「出品する」ボタンを押す
        click_on '出品する'
        # 現在のページがトップページなのか確認
        expect(current_path).to eq root_path
        # 画像が出品されているか確認
        expect(page).to have_selector(".item-img")
      end
      it '入力に問題がある場合でエラーが表示されるのを確認' do
        # サインインする
        sign_in(@user)
        # 「出品する」ボタンを押す
        click_on '出品する'
        # 現在のページが商品情報入力ページなのか確認
        expect(current_path).to eq new_product_path
        # 「出品する」ボタンを押す
        click_on '出品する'
        # エラーメッセージが表示されているか確認
        expect(page).to have_selector(".error-alert")
      end
    end
    context 'ログアウト時の作業' do
      it '「出品ボタン」を押すとログイン画面に移動する' do
        # トップページに遷移する
        visit root_path
        # 「出品する」ボタンを押す
        click_on '出品する'
        # 現在のページがログインページなのか確認
        expect(current_path).to eq new_user_session_path
      end
      it '商品出品ページにURLから直接アクセスするとログイン画面に移動する' do
        # 商品出品画面に遷移する
        visit new_product_path
        # 現在のページがログインページなのか確認
        expect(current_path).to eq new_user_session_path
      end
    end
  end
end
