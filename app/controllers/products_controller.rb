class ProductsController < ApplicationController
  def index
    @products_by_name = Product.order(:name).limit(5)
    @products_by_price = Product.order(:price).limit(2)
  end

  def create
    new_product = params.require(:product).permit(:name, :desc, :count, :price)
    Product.create(new_product)
  end
end