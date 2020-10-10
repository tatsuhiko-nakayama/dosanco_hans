class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def show
    @user = current_user

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    if @user.card
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email)
  end
end
