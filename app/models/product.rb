class Product < ApplicationRecord
  bleongs_to :user

  with_options presence: true do
    validates :name,        length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :precture_id
    validates :delivery_days_id
    validates :price
  end
end
