API_V1 = {
  swagger: '2.0',
  info: {
    title: 'API V1',
    version: 'v1'
  },
  basePath: '/api/v1',
  definitions: {
    casino: CASINO_SCHEMA,
    casinos_collection: CASINOS_COLLECTION_SCHEMA,
    casino_resource: CASINO_RESOURCE_SCHEMA,
    bet: BET_SCHEMA,
    bets_collection: BETS_COLLECTION_SCHEMA,
    bet_resource: BET_RESOURCE_SCHEMA,
    monkey: MONKEY_SCHEMA,
    monkeys_collection: MONKEYS_COLLECTION_SCHEMA,
    monkey_resource: MONKEY_RESOURCE_SCHEMA,
  }
}
