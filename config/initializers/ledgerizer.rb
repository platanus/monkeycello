Ledgerizer.setup do |conf|
  conf.tenant(:casino, currency: :ban) do
    # where the casino keeps the bananas (like a bank account)
    conf.asset :vault

    # where monkeys keep their betting chips. Is a liability for the casino, because the casino
    # should pay back the equivalent bananas.
    conf.liability :wallet
  end
end
