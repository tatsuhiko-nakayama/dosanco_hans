class LikesController < ApplicationController
  before_action :find_item

  def create
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    redirect_to item_path(@item.id)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    @like.destroy
    redirect_to item_path(@item.id)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
