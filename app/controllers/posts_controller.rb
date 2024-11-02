class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    is_matching_login_user
    @post = Post.find(params[:id])
  end

  def update
    is_matching_login_user
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "successfully"
      redirect_to post_path(@post.id)
    else
      @posts = Post.all.order(id: :asc)
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :images)
  end

  def is_matching_login_user
    post = Post.find(params[:id])
    unless post.user.id == current_user.id
      redirect_to posts_path
    end
  end

end
