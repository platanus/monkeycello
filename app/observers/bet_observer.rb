class BetObserver < PowerTypes::Observer
  after_save :ledgerize_it

  def ledgerize_it
    LedgerizeBet.for(bet: object)
  end
end
