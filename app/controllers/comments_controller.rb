class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to list_path(@post), notice: "コメントが投稿されました。"
    else
      redirect_to list_path(@post), alert: "コメントの投稿に失敗しました。"
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to list_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
