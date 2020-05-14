class UsersController < ApplicationController
    def index
        @users = User.all
        @deposit = Deposit.new
        @withdrawal = Withdrawal.new
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @casino =  @user.casino
        @user.destroy
        redirect_to @casino
    end

end