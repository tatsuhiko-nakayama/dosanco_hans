class OrdersController < ApplicationController
  before_action :find_item, only: [:index, :create]
  before_action :block_index, only: :index
  before_action :block_no_card, only: :index

  def index
    @order = OrderAddress.new
    find_card
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      find_card
      render :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :city, :house_num, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_card
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token,
      currency: 'jpy'
      )
  end

  def block_index
    redirect_to item_path(@item.id) if @item.order || @item.user == current_user
  end

  def block_no_card
    redirect_to user_path(current_user.id) unless current_user.card
  end

end
