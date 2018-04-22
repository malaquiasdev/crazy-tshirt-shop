class ProductsController < ApplicationController
  before_action(:set_product, only: [:edit, :update, :destroy])

  def new
    @product = Product.new
    set_departments
  end

  def index
    @products_order_by_name = Product.order(:name)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product created with sucess :)'
      redirect_to(root_url)
    else
      render_view(:new)
    end
  end

  def edit
    render_view(:edit)
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Product successfully updated \o/'
      redirect_to(root_url)
    else
      render_view(:edit)
    end
  end

  def search
    @name = params[:name]
    @products_filter_by_name = Product.where('name like ?', "%#{@name}%")
  end

  def destroy
    @product.destroy
    redirect_to(root_url)
  end

  private

  def render_view(view)
    set_departments
    render(view)
  end

  def set_departments
    @departments = Department.all
  end

  def set_product
    id = params[:id]
    @product = Product.find(id)
  end

  def product_params
    params.require(:product)
          .permit(:name, :desc, :count, :price, :department_id)
  end
end
