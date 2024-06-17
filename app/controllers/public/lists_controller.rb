class Public::ListsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @selected_tags = Tag.where(id: @post.tag_ids)
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :image, :comment)
  end
end
