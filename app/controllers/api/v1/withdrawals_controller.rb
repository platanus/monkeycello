# frozen_string_literal: true

class Api::V1::WithdrawalsController < Api::V1::BaseController
  def index
    respond_with withdrawals
  end

  def show
    respond_with withdrawal
  end

  def create
    respond_with withdrawals.create!(withdrawal_params)
  end

  def update
    respond_with withdrawal.update!(withdrawal_params)
  end

  def destroy
    respond_with withdrawal.destroy!
  end

  private

  def withdrawal
    @withdrawal ||= Withdrawal.find_by!(id: params[:id])
  end

  def withdrawals
    @withdrawals ||= user.withdrawals
  end

  def user
    @user ||= User.find_by!(id: params[:user_id])
  end

  def withdrawal_params
    params.require(:withdrawal).permit(
      :user_id,
      :bananas
    )
  end
end
