# frozen_string_literal: true

class Api::V1::BetsController < Api::V1::BaseController
  def index
    respond_with bets
  end

  def show
    respond_with bet
  end

  def create
    respond_with Bet.create!(casino: this_casino, winner: pick_random_user)
  end

  def update
    respond_with bet.update!(bet_params)
  end

  def destroy
    respond_with bet.destroy!
  end

  private

  def bet
    @bet ||= Bet.find_by!(id: params[:id].to_i)
  end

  def bets
    @bets ||= user.bets
  end

  def user
    @user ||= User.find_by!(id: params[:user_id].to_i)
  end

  def bet_params
    params.require(:bet).permit(
      :casino_id
    )
  end

  def this_casino
    Casino.find_by!(id: params[:bet][:casino_id])
  end

  def pick_random_user
    this_casino.users.sample
  end

end
