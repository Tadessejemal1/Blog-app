class LikesController < ApplicationController
    def create
      @post = Post.find(params[:post_id] || params[:id])
      @like = @current_user.likes.new(likes_params)
      @like.author_id = current_user.id
    
      if @like.save
        flash[:success] = 'Like saved successfully'
        redirect_to user_post_path(@like.author_id, @like.post_id)
      else
        flash.now[:error] = 'Error: Like could not be saved'
        render 'new'
      end
    end
    
    private
    
    def likes_params
      params.require(:like).permit(:post_id, :author_id)
    end
end  