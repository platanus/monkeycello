# frozen_string_literal: true

class Api::V1::CasinoSerializer < ActiveModel::Serializer
  type :casino
  # has_many :users

  attributes(
    :name,
    :created_at,
    :updated_at,
    :edition
  )
end
