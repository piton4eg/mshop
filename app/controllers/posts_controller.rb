class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authorize, only: [:show, :index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = t('views.post.created')
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = t('views.post.updated')
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = t('views.post.deleted')
    redirect_to posts_path
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :value, images_attributes: [:id, :image, :image_cache, :remote_image_url, :remove_image, :_destroy])
  end
end
