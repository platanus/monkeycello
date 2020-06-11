class Api::V1::BetsController < Api::V1::BaseController
  def index
    return casino.bets if params[:casino_id]

    monkey.bets_won
  end

  def show
    respond_with bet
  end

  def create
    respond_with bets.create!(bet_params)
  end

  def update
    respond_with bet.update!(bet_params)
  end

  def destroy
    respond_with bet.destroy!
  end

  private

  def bet
    @bet ||= Bet.find_by!(id: params[:id])
  end

  def bets
    @bets ||= casino.bets
  end

  def casino
    @casino ||= Casino.find_by!(id: params[:casino_id])
  end

  def monkey
    @monkey ||= Monkey.find_by!(id: params[:winner_id])
  end

  def bet_params
    params.require(:bet).permit(
      :winner_id,
      :casino_id
    )
  end
end
