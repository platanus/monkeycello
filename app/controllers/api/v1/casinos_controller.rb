class Api::V1::CasinosController < Api::V1::BaseController
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
    @casino ||= Casino.find_by!(id: params[:id])
  end

  def casino_params
    params.require(:casino).permit(
      :name
    )
  end

  def create_players
    n_monkeys = params['casino']['n_monkeys'].to_i
    bananas = params['casino']['bananas'].to_i
    n_monkeys.times.each do
      monkey = Monkey.create!(
        casino: @casino,
        name: Faker::Superhero.name
      )
      Deposit.create(monkey: monkey, amount: bananas)
    end
  end
end
