class ProductsController < ApplicationController
  skip_before_filter :authorize, only: [:show, :index]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = t('views.product.created')
      redirect_to @product
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = t('views.product.updated')
      redirect_to root_path
    else
      render 'edit'
    end   
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = t('views.product.deleted')
    redirect_to root_path
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :image_cache, :image, :remote_image_url, :remove_image, images_attributes: [:id, :image, :image_cache, :remote_image_url, :remove_image, :_destroy])
    end
end
