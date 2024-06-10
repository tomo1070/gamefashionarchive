class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to lists_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :comment, :tag, :created_at, :updated_at, :user_id, :image)
  end
end