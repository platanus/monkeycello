class WithdrawalObserver < PowerTypes::Observer
  after_save :ledgerize_it

  def ledgerize_it
    LedgerizeWithdrawal.for(withdrawal: object)
  end
end
