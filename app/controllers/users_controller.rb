class UsersController < ApplicationController
  before_action :block_mypage, only: :show
  before_action :block_edit, only: :edit
  before_action :set_user, only: [:edit, :update, :show]

  def edit
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      move_to_toppage
    else
      render :show
    end
  end

  def show
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)

    if @user.card
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :email)
  end

  def move_to_toppage
    redirect_to root_path
  end

  def block_mypage
    redirect_to new_user_registration_path unless current_user
  end

  def block_edit
    user = User.find(params[:id])
    move_to_toppage unless current_user.id == user.id
  end
end
