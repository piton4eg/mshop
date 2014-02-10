class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    @products = Product.order(:name).limit(4)
    @cart = current_cart
  end
end
