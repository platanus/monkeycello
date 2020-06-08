class Api::V1::BetSerializer < ActiveModel::Serializer
  type :bet

  attributes(
    :casino_id
  )
end
