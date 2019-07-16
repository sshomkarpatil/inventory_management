class ProductsController < ApplicationController
  before_action :set_products, only: [:index]

  def index
    @products = @products.includes(:warehouses, :warehouses_products)
  end

  private

  def set_products
    @products = Product.all
  end

end
