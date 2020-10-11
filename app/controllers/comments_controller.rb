class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@comment.item_id)
    else
      redirect_to item_path(@comment.item_id)
    end
  end

  def update
  end
  

  def destroy
  end

  def show
  end

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
