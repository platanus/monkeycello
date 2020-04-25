Ledgerizer.setup do |conf|
  conf.tenant(:casino, currency: :ban) do
    # where the casino keeps the bananas (like a bank account)
    conf.asset :vault

  end
end
