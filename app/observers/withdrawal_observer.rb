class WithdrawalObserver < PowerTypes::Observer
  after_save :ledgerize_it

  def ledgerize_it
    LedgerizeWithdrawalJob.perform_later(object)
  end
end
