class ItemsController < ApplicationController
  before_action :block_new, only: :new

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end



  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :from_id, :day_id).merge(user_id: current_user.id)
  end

  def block_new
    redirect_to new_user_registration_path if !current_user 
  end

end
