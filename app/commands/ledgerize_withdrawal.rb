class LedgerizeWithdrawal < PowerTypes::Command.new(:withdrawal)
  include Ledgerizer::Execution::Dsl

  def perform
    execute_withdrawal_bananas_entry(
      tenant: @withdrawal.monkey.casino,
      document: @withdrawal,
      datetime: @withdrawal.created_at
    ) do
      debit(account: :wallet, accountable: @withdrawal.monkey, amount: @withdrawal.bananas)
      credit(account: :vault, amount: @withdrawal.bananas - @withdrawal.fee)
      credit(account: :withdrawal_fees, amount: @withdrawal.fee)
    end
  end
end
