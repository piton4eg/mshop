class CartsController < ApplicationController
  #skip_before_filter :authorize, only: [:create, :update, :destroy]
  before_action :set_cart, only: [:edit, :update]

  def index
    @carts = Cart.all
  end

  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error t('errors.cart.no_present', cart_id: params[:id])
      redirect_to root_url, notice: t('views.cart.no_present')
    else
      respond_to do |format|
        format.html
        format.json { render json: @cart }
      end
    end
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: t('views.cart.created') }
        format.json { render action: 'show', status: :created, location: @cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: t('views.cart.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to carts_url, notice: t('views.cart.empty') }
      format.js
      format.json { head :ok }
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params[:cart]
  end
end
