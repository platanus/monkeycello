import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
import getMonkeys from '../../javascript/api/monkeys';
import postBet from '../../javascript/api/bets';

Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    monkeys: null,
    lastWinnerId: null,
  },
  mutations: {
    setMonkeys(state, payload) {
      state.monkeys = payload;
    },
    setWinner(state, payload) {
      state.lastWinnerId = payload;
    },
  },
  actions: {
    getMonkeysAction({ commit }, { casinoId }) {
      return getMonkeys(casinoId)
        .then((response) => {
          commit('setMonkeys', response);
        });
    },
    postBetAction({ commit }, { casinoId }) {
      return postBet(casinoId)
        .then((response) => {
          commit('setWinner', response.winner_id);
        });
    },

  },
});

export default store;
