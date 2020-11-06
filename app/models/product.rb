class Product < ApplicationRecord
  belongs_to  :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_days

  with_options presence: true do
    validates :image
    validates :name,        length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
  end

  with_options presence: true, numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :delivery_fee_id
    validates :delivery_days_id
  end

  with_options presence: true,
               numericality: { only_integer: true, message: 'Half-width number' },
               inclusion: { in: 300..9_999_999, message: 'Out of setting range' } do
    validates :price
  end
end
