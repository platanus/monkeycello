API_V1 = {
  swagger: '2.0',
  info: {
    title: 'API V1',
    version: 'v1'
  },
  basePath: '/api/v1',
  definitions: {
    monkey: MONKEY_SCHEMA,
    monkeys_collection: MONKEYS_COLLECTION_SCHEMA,
    monkey_resource: MONKEY_RESOURCE_SCHEMA,
    casino: CASINO_SCHEMA,
    casinos_collection: CASINOS_COLLECTION_SCHEMA,
    casino_resource: CASINO_RESOURCE_SCHEMA,
  }
}
