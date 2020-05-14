class RegisterDeposit < PowerTypes::Command.new(:deposit)
  include Ledgerizer::Execution::Dsl

  def perform
    execute_user_deposit_bananas_entry(
      tenant: casino,
      document: @deposit,
      datetime: @deposit.created_at
    ) do
      debit(account: :vault, amount: bananas_in_deposit)
      credit(account: :wallet, accountable: @deposit.user, amount: bananas_in_deposit)
    end
  end

  private

  def bananas_in_deposit
    Money.from_amount(@deposit.bananas, 'BAN')
  end

  def casino
    @deposit.user.casino
  end
end
