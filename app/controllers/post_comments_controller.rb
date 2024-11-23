class PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    comment = PostComment.find(params[:id])
    comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
