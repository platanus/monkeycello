class Api::V1::BetSerializer < ActiveModel::Serializer
  type :bet

  attributes(
    :winner_id,
    :casino_id,
    :created_at,
    :updated_at
  )
end
