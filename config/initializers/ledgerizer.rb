Ledgerizer.setup do |conf|
  conf.tenant(:casino, currency: :ban) do
    # where the casino keeps the bananas (like a bank account)
    conf.asset :vault

    # casino incomes for withdrawal services
    conf.income :withdrawal_fees

    # where monkeys keep their betting chips. Is a liability for the casino, because the casino
    # should pay back the equivalent bananas.
    conf.liability :wallet

    # where monkey puts their chips during a bet
    conf.liability :bet_table

    # when monkeys exchange bananas for chips
    conf.entry :deposit_bananas, document: :deposit do
      # increases the amount of bananas in the vault
      conf.debit account: :vault

      # increases debt of bananas for a specific monkey
      conf.credit account: :wallet, accountable: :monkey
    end

    # when monkeys change back their chips for bananas
    conf.entry :withdrawal_bananas, document: :withdrawal do
      # decreases debt of bananas to a specific monkey
      conf.debit account: :wallet, accountable: :monkey

      # decreases the amount of bananas in the vault
      conf.credit account: :vault

      # increases casino's incomes
      conf.credit account: :withdrawal_fees
    end

    # when monkeys move chips to the betting table
    conf.entry :bet_bananas, document: :bet do
      # decreases debt of bananas to a specific monkey
      conf.debit account: :wallet, accountable: :monkey

      # increases debt on chips kept in the betting table
      conf.credit account: :bet_table
    end

    # when the winner monkey receives the jackpot
    conf.entry :receive_jackpot, document: :bet do
      # decreases debt of bananas in the betting table
      conf.debit account: :bet_table

      # increases debt of bananas to a specific monkey (the winner)
      conf.credit account: :wallet, accountable: :monkey
    end
  end
end
