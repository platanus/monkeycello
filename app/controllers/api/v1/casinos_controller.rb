require 'faker'

class Api::V1::CasinosController < Api::V1::BaseController
  def index
    respond_with Casino.all
  end

  def show
    respond_with casino
  end

  def create
    respond_with Casino.create!(casino_name)
  end

  private

  def casino
    @casino = Casino.find_by!(id: params[:id]) || create
  end

  def casino_name
    { :name => Faker::Company.name }
  end
end
