import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
import { getMonkeys, getAllMonkeys } from '../../javascript/api/monkeys';
import postBet from '../../javascript/api/bets';
import getCasinos from '../../javascript/api/casinos';
import topTenWinners from './helper';

Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    monkeys: null,
    lastWinnerId: null,
    casinos: null,
    topTen: null,
  },
  mutations: {
    setMonkeys(state, payload) {
      state.monkeys = payload;
    },
    setWinner(state, payload) {
      state.lastWinnerId = payload;
    },
    setCasinos(state, payload) {
      state.casinos = payload;
    },
    setTopTen(state, payload) {
      state.topTen = topTenWinners(payload);
    },
  },
  actions: {
    getMonkeysAction({ commit }, { casinoId }) {
      return getMonkeys(casinoId)
        .then((response) => {
          commit('setMonkeys', response);
        });
    },
    updateTopTenAction({ commit }) {
      return getAllMonkeys()
        .then((response) => {
          commit('setTopTen', response);
        });
    },
    getCasinosAction({ commit }) {
      return getCasinos()
        .then((response) => {
          commit('setCasinos', response);
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
