class WithdrawalObserver < PowerTypes::Observer
    after_save :ledgerize_it
  
    def ledgerize_it
      RegisterWithdrawal.for(withdrawal: object)
    end
end
  