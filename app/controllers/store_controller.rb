class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    @cart = current_cart

    @popular_products = Product.popular.limit(4)
    @last_products = Product.latest.limit(4)

    @posts = Post.latest.limit(3)
  end
end
