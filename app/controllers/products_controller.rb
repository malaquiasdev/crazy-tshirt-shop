class ProductsController < ApplicationController
  def index
    @products_order_by_name = Product.order(:name)
  end

  def create
    new_product = params.require(:product)
                        .permit(:name, :desc, :count, :price)
    Product.create(new_product)
    redirect_to root_url
  end

  def search
    @name = params[:name]
    @products_filter_by_name = Product.where('name like ?', "%#{nome}%")
  end

  def destroy
    id = params[:id]
    Product.destroy(id)
    redirect_to root_url
  end
end
