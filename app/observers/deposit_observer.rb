class DepositObserver < PowerTypes::Observer
  after_save :ledgerize_it

  def ledgerize_it
    RegisterDeposit.for(deposit: object)
  end
end
