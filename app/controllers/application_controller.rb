class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_filter :authorize
  #
  #protected
  #
  #def authorize
  #  unless User.where(id: session[:user_id]).first
  #    redirect_to login_url, notice: 'Необходимо авторизоваться.'
  #  end
  #end

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end
