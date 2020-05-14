class DepositsController < ApplicationController
    Ledgerizer.definition.running_inside_transactional_fixtures = true
    def index
        @deposits = Deposit.all
    end

    def create
        @user = User.find(params[:user_id])
        @casino = @user.casino
        bananas = params['deposit']['bananas'].to_i
        Deposit.create(user: @user, bananas: bananas)
        redirect_to @casino
    end
    Ledgerizer.definition.running_inside_transactional_fixtures = true
end