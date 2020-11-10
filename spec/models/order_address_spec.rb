require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '全ての情報が揃っていれば登録できる' do
        expect(@address).to be_valid
      end
    end
    context '商品出品登録ができないとき' do
      it 'カード情報がないと登録できない' do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号がないと登録できない' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にはハイフンがないと登録できない' do
        @address.postal_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal code Input correctly')
      end

      it '都道府県がないと登録できない' do
        @address.prefecture_id = 0
        @address.valid?
        expect(@address.errors.full_messages).to include('Prefecture Select')
      end

      it '市町村区がないと登録できない' do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it '番地がないと登録できない' do
        @address.house_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号がないと登録できない' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が12桁以上だと登録できない' do
        @address.phone_number = 123_456_789_012
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number Input only number')
      end

      it '電話番号が11桁未満ないと登録できない' do
        @address.phone_number = 123_456_789
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number Input only number')
      end
    end
  end
end
