class DepositObserver < PowerTypes::Observer
  after_save :ledgerize_it

  def ledgerize_it
    LedgerizeDepositJob.perform_later(object)
  end
end
