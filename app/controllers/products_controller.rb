class ProductsController < ApplicationController
  before_action :set_products, only: [:index]
  before_action :set_product, only: [:edit, :update]

  def index
    @products = @products.includes(:warehouses, :warehouses_products)
  end

  def edit
  end

  def update
    if @product.update_attributes(product_update_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  private

  def set_products
    @products = Product.all
  end

  def set_product
    @product = Product.includes(warehouses_products: :warehouse).find params[:id]
  end

  def product_update_params
    params.require(:product).permit(
      warehouses_products_attributes: [:id, :item_count, :low_item_threshold])
  end

end
