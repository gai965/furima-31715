class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code
    validates :precture_id, numericality: { other_than: 0, message: 'Select' }
    validates :explanation
    validates :city
    validates :house_number
    validates :phone_number
  end
end
