class BetObserver < PowerTypes::Observer
  after_save :ledgerize_it

  def ledgerize_it
    LedgerizeBetJob.perform_later(object)
  end
end
