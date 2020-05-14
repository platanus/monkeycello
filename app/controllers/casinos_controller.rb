class CasinosController < ApplicationController
    Ledgerizer.definition.running_inside_transactional_fixtures = true
    def index
        @casinos = Casino.all
    end

    def create
        @casino = Casino.new(edition: edition_param)
        @casino.save
        create_players
        redirect_to @casino
    end

    def show
        @casino = Casino.find(params[:id])
    end

    def destroy
        @casino =  Casino.find(params[:id])
        @casino.destroy
        redirect_to @casino
    end

    private

    def edition_param
        params[:casino][:edition]
    end

    def create_players
        players = params['casino']['quantity_players'].to_i
        bananas = params['casino']['bananas'].to_i
        players.times.each do
            player = User.create!(
                casino: @casino,
                email: Faker::Internet.unique.email,
                password: Faker::Internet.password
            )
        Deposit.create(user: player, bananas: bananas)
        end
    end
    Ledgerizer.definition.running_inside_transactional_fixtures = true
end