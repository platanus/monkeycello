# frozen_string_literal: true

class Api::V1::DepositsController < Api::V1::BaseController
  def index
    respond_with deposits
  end

  def show
    respond_with deposit
  end

  def create
    respond_with deposits.create!(deposit_params)
  end

  def update
    respond_with deposit.update!(deposit_params)
  end

  def destroy
    respond_with deposit.destroy!
  end

  private

  def deposit
    @deposit ||= Deposit.find_by!(id: params[:id])
  end

  def deposits
    @deposits ||= user.deposits
  end

  def user
    @user ||= User.find_by!(id: params[:user_id])
  end

  def deposit_params
    params.require(:deposit).permit(
      :user_id,
      :bananas
    )
  end
end
