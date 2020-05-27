class LedgerizeWithdrawalJob < ApplicationJob
  queue_as :default

  def perform(withdrawal)
    LedgerizeWithdrawal.for(withdrawal: withdrawal)
  end
end
