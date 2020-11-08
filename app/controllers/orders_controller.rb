class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def create
    
  end

  
end
