# frozen_string_literal: true

class Api::V1::CasinosController < Api::V1::BaseController
  Ledgerizer.definition.running_inside_transactional_fixtures = true
  def index
    respond_with Casino.all
  end

  def show
    respond_with casino
  end

  def create
    @casino = Casino.create!(casino_params)
    create_players
    respond_with @casino
  end

  def update
    respond_with casino.update!(casino_params)
  end

  def destroy
    respond_with casino.destroy!
  end

  private

  def casino
    @casino ||= Casino.find_by!(id: params[:id].to_i)
  end

  def casino_params
    params.require(:casino).permit(
      :name,
      :edition
    )
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

