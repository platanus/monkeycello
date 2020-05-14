# frozen_string_literal: true

DEPOSIT_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'deposit' },
    attributes: {
      type: :object,
      properties: {
        user_id: { type: :integer, example: 666, 'x-nullable': true },
        bananas: { type: :integer, example: 666, 'x-nullable': true },
        created_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
        updated_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true }
      },
      required: []
    }
  },
  required: %i[
    id
    type
    attributes
  ]
}.freeze

DEPOSITS_COLLECTION_SCHEMA = {
  type: 'object',
  properties: {
    data: {
      type: 'array',
      items: { '$ref' => '#/definitions/deposit' }
    }
  },
  required: [
    :data
  ]
}.freeze

DEPOSIT_RESOURCE_SCHEMA = {
  type: 'object',
  properties: {
    data: { '$ref' => '#/definitions/deposit' }
  },
  required: [
    :data
  ]
}.freeze
