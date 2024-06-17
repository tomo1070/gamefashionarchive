class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
    redirect_to lists_path
    else
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to user_path(@post.user.id)  
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to lists_path
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :comment, :tag, :created_at, :updated_at, :user_id, :image)
  end
end