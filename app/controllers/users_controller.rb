class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authorize, only: [:new, :create] if User.count.zero?

  def index
    @users = User.order(:name)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url, notice: t('views.user.created', user: @user.name)
    else
      render action: 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: t('views.user.updated', user: @user.name)
    else
      render action: 'edit'
    end
  end

  def destroy
    begin
      @user.destroy
      session[:user_id] = nil
      flash[:notice] = t('views.user.deleted', user: @user.name)
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to users_url
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
