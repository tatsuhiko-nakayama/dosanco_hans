class CardsController < ApplicationController
  before_action :block_new, only: :new
  before_action :block_double, only: :new

  def new
    @card = Card.new
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
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

  def block_new
    user = User.find(params[:user_id])
    redirect_to root_path if !current_user || current_user.id != user.id
  end

  def block_double
    move_to_mypage if current_user.card
  end
end
