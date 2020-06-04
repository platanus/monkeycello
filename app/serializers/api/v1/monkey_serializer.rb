class Api::V1::MonkeySerializer < ActiveModel::Serializer
  type :monkey

  attributes(
    :casino_id,
    :name,
    :created_at,
    :updated_at
  )
end
