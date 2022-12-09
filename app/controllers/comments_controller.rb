class CommentsController < ApplicationController

  def index
    @user = current_user
    @comments = @user.comments

    respond_to do |format|
      format.json { render json: @comments }
    end
  end
  
  def new
    @user = current_user
    @comment = Comment.new
  end

  def create
    current_user = User.find_by!(id: params[:user_id])
    @post = Post.find_by!(id: params[:post_id])
    comment = Comment.new(author: current_user, post: @post, text: params[:comment][:text])

    if comment.save
      redirect_to user_posts_url
    else
      redirect_to new_user_post_comment_url
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@user.id, @comment.post_id), status: 303
  end
end
