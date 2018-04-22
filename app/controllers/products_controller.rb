class ProductsController < ApplicationController

  def new
    @product = Product.new
    @departments = Department.all
  end

  def index
    @products_order_by_name = Product.order(:name)
  end

  def create
    product_params = params.require(:product)
                           .permit(:name,
                                   :desc,
                                   :count,
                                   :price,
                                   :department_id)

    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = 'Product created with sucess :)'
      redirect_to(root_url)
    else
      render(:new)
    end

  end

  def search
    @name = params[:name]
    @products_filter_by_name = Product.where('name like ?', "%#{@name}%")
  end

  def destroy
    id = params[:id]
    Product.destroy(id)
    redirect_to(root_url)
  end
end
