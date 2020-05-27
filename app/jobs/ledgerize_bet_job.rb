class LedgerizeBetJob < ApplicationJob
  queue_as :default

  def perform(bet)
    LedgerizeBet.for(bet: bet)
  end
end
