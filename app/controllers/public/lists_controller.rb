class Public::ListsController < ApplicationController

  def index
    if params[:tag]
      @posts = Post.where(tag: params[:tag]).page(params[:page])
    else
      @posts = Post.page(params[:page])
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :comment)
  end
end
