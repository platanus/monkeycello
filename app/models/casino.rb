class Casino < ApplicationRecord
  include LedgerizerTenant

  def vault_account
    accounts.find_by(name: :vault)
  end

  def withdrawal_fees_account
    accounts.find_by(name: :withdrawal_fees)
  end
end
