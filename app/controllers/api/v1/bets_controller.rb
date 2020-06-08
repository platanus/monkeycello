class Api::V1::BetsController < Api::V1::BaseController
  def create
    @casino = this_casino
    respond_with Bet.create(casino: @casino, winner: pick_random_monkey)
  end

  private
  
  def this_casino
    Casino.last
  end

  def pick_random_monkey
    Monkey.all.sample
  end
end
