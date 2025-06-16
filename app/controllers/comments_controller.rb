class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    @post=Post.find(params[:post_id])
    @comment=@post.comments.create(comment_params.merge(user_id:current_user.id))
    if @comment.valid?
      redirect_to root_path
    else
      flash[:alert]="Invalid params"
      redirect_to root_path
    end
  end

  def destroy
    @post =Post.find(params[:post_id])
    @comment= @post.comments.find(params[:id])
    @comment.destroy if @comment.user == current_user
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:post_id)
  end
end
