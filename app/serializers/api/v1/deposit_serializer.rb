# frozen_string_literal: true

class Api::V1::DepositSerializer < ActiveModel::Serializer
  type :deposit

  attributes(
    :user_id,
    :bananas,
    :created_at,
    :updated_at
  )
end
