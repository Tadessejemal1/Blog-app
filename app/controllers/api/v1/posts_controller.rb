class Api::V1::PostsController < ApplicationController
    def index
      @user = User.find(params[:user_id])
      posts = Post.includes(comments: [:author]).where(author_id: params[:user_id])
  
      render json: posts, status: :ok
    end
  
    def show
      @user = User.find(params[:user_id])
      @post = Post.includes(comments: [:author]).find(params[:id])
      render json: @post, status: :ok
    end
end