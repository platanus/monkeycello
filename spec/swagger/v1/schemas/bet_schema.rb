BET_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'bet' },
    attributes: {
      type: :object,
      properties: {
        winner_id: { type: :integer, example: 666, 'x-nullable': true },
        casino_id: { type: :integer, example: 666, 'x-nullable': true },
        created_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
        updated_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true }
      },
      required: []
    }
  },
  required: [
    :id,
    :type,
    :attributes
  ]
}

BETS_COLLECTION_SCHEMA = {
  type: "object",
  properties: {
    data: {
      type: "array",
      items: { "$ref" => "#/definitions/bet" }
    }
  },
  required: [
    :data
  ]
}

BET_RESOURCE_SCHEMA = {
  type: "object",
  properties: {
    data: { "$ref" => "#/definitions/bet" }
  },
  required: [
    :data
  ]
}
