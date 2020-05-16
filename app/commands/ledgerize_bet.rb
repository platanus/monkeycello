class LedgerizeBet < PowerTypes::Command.new(:bet)
  include Ledgerizer::Execution::Dsl

  def perform
    ledgerize_initial_bet
    ledgerize_jackpot
  end

  private

  def ledgerize_initial_bet
    execute_bet_bananas_entry(
      tenant: @bet.casino,
      document: @bet,
      datetime: @bet.created_at
    ) do
      Monkey.all.each do |monkey|
        debit(account: :wallet, accountable: monkey, amount: @bet.bananas_bet)
      end

      credit(account: :bet_table, amount: @bet.bananas_jackpot)
    end
  end

  def ledgerize_jackpot
    execute_receive_jackpot_entry(
      tenant: @bet.casino,
      document: @bet,
      datetime: @bet.created_at
    ) do
      debit(account: :bet_table, amount: @bet.bananas_jackpot)
      credit(account: :wallet, accountable: @bet.winner, amount: @bet.bananas_jackpot)
    end
  end
end
