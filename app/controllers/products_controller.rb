class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
      flash[:notice] = "Product was successfully updated." 
    else
      render 'edit'
    end
  end

  def destroy
    bought_product = BoughtProduct.where(product_id: @product.id)
    if bought_product.empty?
      @product.destroy
      redirect_to products_url
      flash[:notice] = "Product was successfully destroyed." 
    else
      redirect_to producy_url
      flash[:notice] = "Product has been used. Cannot be destroyed."
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name,:description, :price, :weight)
  end
end