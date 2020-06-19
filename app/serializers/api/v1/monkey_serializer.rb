class Api::V1::MonkeySerializer < ActiveModel::Serializer
  type :monkey

  attributes(
    :casino_id,
    :name,
    :bananas
  )

  def bananas
    object.wallet_account.balance.format
  end
end
