class Api::V1::PostsController < ApplicationController
    def index
      @posts = Post.where(user_id: params[:user_id])
      if @posts.empty?
        json_response({ msg: 'no post or user found' }, 400)
      else
        render json: @posts
      end
    end
  
    def current_user
      return unless request.headers.include? 'Authorization'
  
      @current_user ||= User.find(payload['user_id'])
    end
end