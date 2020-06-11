class Api::V1::CasinoSerializer < ActiveModel::Serializer
  type :casino

  attributes(
    :name,
    :created_at,
    :updated_at
  )
end
