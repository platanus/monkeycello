class LedgerizeDeposit < PowerTypes::Command.new(:deposit)
  include Ledgerizer::Execution::Dsl

  def perform
    execute_deposit_bananas_entry(
      tenant: @deposit.monkey.casino,
      document: @deposit,
      datetime: @deposit.created_at
    ) do
      debit(account: :vault, amount: @deposit.bananas)
      credit(account: :wallet, accountable: @deposit.monkey, amount: @deposit.bananas)
    end
  end
end
