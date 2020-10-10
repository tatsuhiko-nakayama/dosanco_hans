class CardsController < ApplicationController

  def new
    @card = Card.new
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
      move_to_mypage
    else
      move_to_mypage
    end
  end

  def destroy
    card = Card.find(params[:user_id])
    if card.destroy
      move_to_mypage
    else
      move_to_mypage
    end
  end

  private

  def move_to_mypage
    redirect_to user_path(current_user.id)
  end

end
