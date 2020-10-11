class OrdersController < ApplicationController

  def index
    redirect_to user_path(current_user.id) unless current_user.card
    
      @item = Item.find(params[:item_id])

    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)
    if current_user.card
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end

    @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token,
      currency: 'jpy'
      )

    @order = OrderAddress.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :city, :house_num, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
