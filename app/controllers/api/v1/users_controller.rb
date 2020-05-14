# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  def index
    respond_with users
  end

  def show
    respond_with user
  end

  def create
    respond_with users.create!(user_params)
  end

  def update
    respond_with user.update!(user_params)
  end

  def destroy
    respond_with user.destroy!
  end

  private

  def user
    @user ||= User.find_by!(id: params[:id])
  end

  def users
    @users ||= casino.users
  end

  def casino
    @casino ||= Casino.find_by!(id: params[:casino_id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :encrypted_password,
      :reset_password_token,
      :reset_password_sent_at,
      :remember_created_at,
      :casino_id
    )
  end
end
