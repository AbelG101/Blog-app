class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.author = current_user
    if @post.save
      redirect_to user_posts_path(id: @post.author_id)
    else
      render :new, alert: 'ERROR! something went wrong while creating the post'
    end
  end

  def show
    @post = Post.includes(:author).find(params[:id])
    @user = current_user
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text)
  end
end
