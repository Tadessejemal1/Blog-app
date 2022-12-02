class CommentsController < ApplicationController
    
  def new
    @user = current_user
    @comment = Comment.new
  end  
  def create
    @post = Post.find(params[:post_id] || params[:id])
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post = @post
    if @comment.save
      flash[:success] = "Comment saved successfully"
      redirect_to user_post_url(current_user, @post)
    else
      flash.now[:error] = "Error: Comment could not be saved"
      render:new 
    end  
  end  
  
    private 
  
    def comment_params
      params.require(:comment).permit(:text, :author_id, :post_id)
    end  
end 