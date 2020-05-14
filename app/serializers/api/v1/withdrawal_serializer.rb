# frozen_string_literal: true

class Api::V1::WithdrawalSerializer < ActiveModel::Serializer
  type :withdrawal

  attributes(
    :user_id,
    :bananas,
    :created_at,
    :updated_at
  )
end
