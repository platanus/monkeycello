class Api::V1::BetsController < Api::V1::BaseController
  def index
    respond_with Bet.all
  end

  def show
    respond_with bet
  end

  def create

    respond_with Bet.create!(bet_params)
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

  def bet_params
    params.require(:bet).permit(
      :casino_id
    )
  end
end
