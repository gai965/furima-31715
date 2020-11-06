class Product < ApplicationRecord
  belongs_to  :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name,        length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price,       numericality: {only_integer: true, message: 'Half-width number'},
                            inclusion: { in: 300..9999999, message: 'Out of setting range'}
  end

  with_options presence: true, format: { with: /[^0]/, message: 'Select' }do
    validates :category_id 
    validates :condition_id
    validates :delivery_fee_id
    validates :precture_id
    validates :delivery_days_id
  end
end
