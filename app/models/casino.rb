class Casino < ApplicationRecord
  include LedgerizerTenant
  has_many :users, dependent: :destroy

  def vault_account
    accounts.find_by(name: :vault)
  end

  def withdrawal_fees_account
    accounts.find_by(name: :withdrawal_fees)
  end
end
