class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:index]

  def index
  end

  def new
    @product = Product.new
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def create
    @product = Product.create(product_params)
    if @product.save
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
