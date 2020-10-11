class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  before_action :block_new, only: :new
  before_action :block_edit, only: :edit

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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :from_id, :day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def block_new
    redirect_to new_user_registration_path unless current_user
  end

  def block_edit
    redirect_to item_path(@item.id) if current_user != @item.user || @item.order
  end
end
