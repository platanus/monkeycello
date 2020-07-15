class CasinosController < ApplicationController
  def index; end

  def show
    @casino = Casino.find_by(id: params[:id])
    redirect_to root_path unless @casino
  end
end
