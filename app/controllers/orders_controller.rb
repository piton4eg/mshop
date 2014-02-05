class OrdersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.page(params[:page]).order('created_at desc').per_page(10)

    respond_to do |format|
      format.html
      format.json { render json: @orders }
    end
  end

  def show
  end

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_url, notice: t('views.cart.empty')
      return
    end

    @order = Order.new
    respond_to do |format|
      format.html
      format.json { render json: @order }
    end
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to root_url, notice: t('views.order.created') }
        format.json { render action: 'show', status: :created, location: @order }
      else
        @cart = current_cart
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: t('views.order.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type)
  end
end
