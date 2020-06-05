class Api::V1::MonkeysController < Api::V1::BaseController
  def index
    respond_with monkeys
  end

  def show
    respond_with monkey
  end

  def create
    respond_with monkeys.create!(monkey_params)
  end

  def update
    respond_with monkey.update!(monkey_params)
  end

  def destroy
    respond_with monkey.destroy!
  end

  private

  def monkey
    @monkey ||= Monkey.find_by!(id: params[:id])
  end

  def monkeys
    @monkeys ||= casino.monkeys
  end

  def casino
    @casino ||= Casino.find_by!(id: params[:casino_id])
  end

  def monkey_params
    params.require(:monkey).permit(
      :casino_id,
      :name
    )
  end
end
