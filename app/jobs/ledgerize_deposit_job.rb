class LedgerizeDepositJob < ApplicationJob
  queue_as :default

  def perform(deposit)
    LedgerizeDeposit.for(deposit: deposit)
  end
end
