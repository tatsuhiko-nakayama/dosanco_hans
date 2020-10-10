class CardsController < ApplicationController

  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
    description: 'test',
    card: params[:card_token]
    )

    card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      user_id: current_user.id
    )

    if card.save
      redirect_to root_path
    else
      redirect_to :new
    end
  end

  def destroy
    card = Card.find(params[:user_id])
    if card.destroy
      redirect_to root_path
    else
      render :show
    end
  end

end
