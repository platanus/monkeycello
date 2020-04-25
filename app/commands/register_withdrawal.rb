class RegisterWithdrawal < PowerTypes::Command.new(:withdrawal)
  include Ledgerizer::Execution::Dsl

  def perform
    execute_user_withdrawal_bananas_entry(
      tenant: casino,
      document: @withdrawal,
      datetime: @withdrawal.created_at
    ) do
      debit(account: :wallet, accountable: @withdrawal.user, amount: bananas_in_withdrawal)
      credit(account: :vault, amount: bananas_in_withdrawal - fee_bananas)
      credit(account: :withdrawal_fees, amount: fee_bananas)
    end
  end

  private

  def bananas_in_withdrawal
    Money.from_amount(@withdrawal.bananas, 'BAN')
  end

  def fee_bananas
    Money.from_amount(1, 'BAN')
  end

  def casino
    Casino.first
  end

end
