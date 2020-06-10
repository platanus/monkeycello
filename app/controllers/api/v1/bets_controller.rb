class Api::V1::BetsController < Api::V1::BaseController
  def index
    respond_with bets
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

  def bet_params
    params.require(:bet).permit(
      :winner_id,
      :casino_id
    )
  end
end
