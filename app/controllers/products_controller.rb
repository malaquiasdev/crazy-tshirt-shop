class ProductsController < ApplicationController
  def index
    @products_by_name = Product.order(:name).limit(5)
    @products_by_price = Product.order(:price).limit(2)
  end
end
