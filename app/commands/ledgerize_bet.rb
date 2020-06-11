class LedgerizeBet < PowerTypes::Command.new(:bet)
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
      monkeys.each do |monkey|
        debit(account: :wallet, accountable: monkey, amount: bananas_bet)
      end

      credit(account: :bet_table, amount: bananas_jackpot)
    end
  end

  def ledgerize_jackpot
    execute_receive_jackpot_entry(
      tenant: casino,
      document: @bet,
      datetime: @bet.created_at
    ) do
      debit(account: :bet_table, amount: bananas_jackpot)
      credit(account: :wallet, accountable: @bet.winner, amount: bananas_jackpot)
    end
  end

  def casino
    @bet.casino
  end

  def monkeys
    casino.monkeys
  end

  def bananas_bet
    Money.from_amount(5, 'BAN')
  end

  def bananas_jackpot
    bananas_bet * monkeys.count
  end
end
