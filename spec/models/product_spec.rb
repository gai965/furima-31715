require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('app/assets/images/test/test.png')
  end

  describe '商品出品機能' do
    context '商品出品登録ができないとき' do
      it '全ての情報が揃っていれば登録できる' do
        expect(@product).to be_valid
      end
    end
    context '商品出品登録ができないとき' do
      it '商品画像がないと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと登録できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がないと登録できない' do
        @product.explanation = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーの情報がないと登録できない' do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Category Select")
      end
      
      it '商品の状態についての情報がないと登録できない' do
        @product.condition_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition Select")
      end

      it '配送料の負担についての情報がないと登録できない' do
        @product.delivery_fee_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee Select")
      end

      it '発送元の地域についての情報がないと登録できない' do
        @product.prefecture_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture Select")
      end

      it '発送日までの日数についての情報がないと登録できない' do
        @product.delivery_days_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery days Select")
      end

      it '価格販売がないと登録できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '価格販売が299円以下だと登録できない' do
        @product.price = Faker::Number.within(range: 0..299)
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Out of setting range")
      end

      it '価格販売が10,000,000円以上だと登録できない' do
        @product.price = Faker::Number.number(digits: 8)
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Out of setting range")
      end

      it '販売価格は半角数字以外だと登録できない' do
        @product.price = 'abc'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Half-width number")
      end
    end
  end
end
