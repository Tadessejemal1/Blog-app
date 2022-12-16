class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    Comment.where(post_id: @post.id).destroy_all
    Like.where(post_id: @post.id).destroy_all
    Post.destroy(@post.id)
    @user = User.find(params[:user_id])

    respond_to do |format|
      if Post.find(params[:id]).nil?
        format.html { redirect_to user_posts_path(@user), success: 'Post successfully delete!' }
      else
        format.html { redirect_to user_posts_path(@user), danger: 'Post was not deleted!' }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author_id, :likes_counter, :comments_counter)
  end
end
