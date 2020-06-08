BET_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'bet' },
    attributes: {
      type: :object,
      properties: {
        casino_id: { type: :integer, example: 666, 'x-nullable': true }
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
