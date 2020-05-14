API_V1 = {
  swagger: '2.0',
  info: {
    title: 'API V1',
    version: 'v1'
  },
  basePath: '/api/v1',
  definitions: {
    bet: BET_SCHEMA,
    bets_collection: BETS_COLLECTION_SCHEMA,
    bet_resource: BET_RESOURCE_SCHEMA,
    casino: CASINO_SCHEMA,
    casinos_collection: CASINOS_COLLECTION_SCHEMA,
    casino_resource: CASINO_RESOURCE_SCHEMA,
    withdrawal: WITHDRAWAL_SCHEMA,
    withdrawals_collection: WITHDRAWALS_COLLECTION_SCHEMA,
    withdrawal_resource: WITHDRAWAL_RESOURCE_SCHEMA,
    deposit: DEPOSIT_SCHEMA,
    deposits_collection: DEPOSITS_COLLECTION_SCHEMA,
    deposit_resource: DEPOSIT_RESOURCE_SCHEMA,
    user: USER_SCHEMA,
    users_collection: USERS_COLLECTION_SCHEMA,
    user_resource: USER_RESOURCE_SCHEMA,
  }
}
