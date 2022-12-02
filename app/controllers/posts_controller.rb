class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @user = current_user
    @post = Post.new
    @post.author_id = current_user.id
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      flash[:success] = "Post saved successfully"
      redirect_to user_post_url(current_user, @post)
    else
      flash.now[:error] = "Error: Post could not be saved"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author_id, :likes_counter, :comments_counter)
  end
end
