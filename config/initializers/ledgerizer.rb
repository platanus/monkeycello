Ledgerizer.setup do |conf|
  conf.tenant(:casino, currency: :ban) do
    # where the casino keeps the bananas (like a bank account)
    conf.asset :vault

    # casino incomes for withdrawal services
    conf.income :withdrawal_fees

    # where monkeys keep their betting chips. Is a liability for the casino, because the casino
    # should pay back the equivalent in bananas.
    conf.liability :wallet

    # where monkey puts their chips during a bet
    conf.liability :bet_table

    # when monkeys exchange bananas for chips
    conf.entry :user_deposit_bananas, document: :deposit do
      # increases the amount of bananas in the vault
      conf.debit account: :vault

      # increases debt of bananas for a specific monkey
      conf.credit account: :wallet, accountable: :user
    end

    # when monkeys change back their chips for bananas
    conf.entry :user_withdrawal_bananas, document: :withdrawal do
      # decreases debt of bananas to a specific monkey
      conf.debit account: :wallet, accountable: :user

      # decreases the amount of bananas in the vault
      conf.credit account: :vault

      # increases casino's incomes
      conf.credit account: :withdrawal_fees
    end
  end
end
