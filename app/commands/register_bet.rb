class RegisterBet < PowerTypes::Command.new(:bet)
  include Ledgerizer::Execution::Dsl

  def perform
    ledgerize_initial_bet
    ledgerize_jackpot
  end

  private

  def ledgerize_initial_bet
    execute_bet_bananas_entry(
      tenant: casino,
      document: @bet,
      datetime: @bet.created_at
    ) do
      User.all.each do |user|
        debit(account: :wallet, accountable: user, amount: bet_bananas)
      end

      credit(account: :bet_table, amount: jackpot_bananas)
    end
  end

  def ledgerize_jackpot
    execute_receive_jackpot_entry(
      tenant: casino,
      document: @bet,
      datetime: @bet.created_at
    ) do
      debit(account: :bet_table, amount: jackpot_bananas)
      credit(account: :wallet, accountable: @bet.winner, amount: jackpot_bananas)
    end
  end

  def jackpot_bananas
    Money.from_amount(User.count * 5, 'BAN')
  end

  def bet_bananas
    Money.from_amount(5, 'BAN')
  end

  def casino
    Casino.first
  end
end
