class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @product = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
    redirect_to action: :index unless user_signed_in?
  end

  def create
    if Product.create(product_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
