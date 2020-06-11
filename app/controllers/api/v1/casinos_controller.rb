class Api::V1::CasinosController < Api::V1::BaseController
  def index
    respond_with Casino.all
  end

  def show
    respond_with casino
  end

  def create
    respond_with Casino.create!(casino_params)
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
end
