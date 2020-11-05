require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録がうまくいくとき' do
      it '情報全てが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'パスワードは、半角英数字混合での入力で登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含ないと登録できない' do
        @user.email = 'test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードがないと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以下だと登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、半角英数字混合での入力しないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'パスワードは、確認用を含めて2回入力しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードとパスワード（確認用）、値の一致しないと登録できない' do
        another_user = FactoryBot.build(:user)
        @user.password_confirmation = another_user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end

  describe '新規登録/本人情報確認' do
    context '新規登録がうまくいかない' do
      it 'ユーザー本名は、名字と名前がそれぞれ必須でないと登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
        @user.lastname = @user.firstname
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須でないと登録できない' do
        @user.lastname = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname Full-width characters')
        @user.lastname = @user.firstname
        @user.firstname = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname Full-width characters')
      end

      it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須でないと登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
        @user.lastname_kana = @user.firstname_kana
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end

      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須でないと登録できない' do
        @user.lastname_kana = /\A[ァ-ン]+\z/
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana Full-width katakana characters')
        @user.lastname_kana = @user.firstname_kana
        @user.firstname_kana = /\A[ァ-ン]+\z/
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana Full-width katakana characters')
      end

      it '生年月日が必須ないと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
