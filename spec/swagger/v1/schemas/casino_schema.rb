# frozen_string_literal: true

CASINO_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'casino' },
    attributes: {
      type: :object,
      properties: {
        name: { type: :string, example: 'Some name', 'x-nullable': true },
        created_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
        updated_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
        edition: { type: :string, example: 'Some edition', 'x-nullable': true }
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

CASINOS_COLLECTION_SCHEMA = {
  type: 'object',
  properties: {
    data: {
      type: 'array',
      items: { '$ref' => '#/definitions/casino' }
    }
  },
  required: [
    :data
  ]
}.freeze

CASINO_RESOURCE_SCHEMA = {
  type: 'object',
  properties: {
    data: { '$ref' => '#/definitions/casino' }
  },
  required: [
    :data
  ]
}.freeze
