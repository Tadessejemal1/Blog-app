class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user)
  end

  def show
    @post = Post.find(params[:id])
  end
end
