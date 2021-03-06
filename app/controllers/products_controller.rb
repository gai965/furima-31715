class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :sale_flag_confirmation, only: [:edit]

  def index
    @product = Product.all.order('created_at DESC')
  end

  def new
    redirect_to action: :index unless user_signed_in?
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to action: :index unless current_user.id == @product.user_id
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to product_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    redirect_to action: :show unless current_user.id == @product.user_id
    @product.destroy
    redirect_to root_path
  end

  private

  def sale_flag_confirmation
    redirect_to root_path unless @product.sale_flag
  end

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
