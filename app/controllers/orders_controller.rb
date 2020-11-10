class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :sale_flag_confirmation, only: [:index]
  before_action :authenticate_user!, only: [:index]

  def index
    @order_address = OrderAddress.new
    redirect_to root_path if current_user.id == @product.user_id
  end

  def create
    @order = Order.create(user_id: current_user.id, product_id: params[:product_id])
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      @product.sale_flag = false
      @product.save
      redirect_to root_path
    else
      @order.destroy
      render :index
    end
  end

  def sale_flag_confirmation
    redirect_to root_path unless @product.sale_flag
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(order_id: @order.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ''  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end
end
