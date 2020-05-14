class WithdrawalsController < ApplicationController
    Ledgerizer.definition.running_inside_transactional_fixtures = true
    def index
        @withdrawals = Withdrawal.all
    end

    def create
        @user = User.find(params[:user_id])
        @casino = @user.casino
        bananas = params['withdrawal']['bananas'].to_i
        Withdrawal.create(user: @user, bananas: bananas)
        redirect_to @casino
    end
    Ledgerizer.definition.running_inside_transactional_fixtures = true
end