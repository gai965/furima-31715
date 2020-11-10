class OrderAddress
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'Input only number' }
    validates :token
  end

  def save
    order = Order.new(user_id: current_user.id, product_id: params[:product_id])
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order_id)
  end
end
