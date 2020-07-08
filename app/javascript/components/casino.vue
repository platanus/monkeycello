<template>
  <div>
    <h1>Casino component</h1>
    <button
      v-if="thereIsWinner"
      @click="showWinnerClick"
    >
      Mostrar ganador
    </button>
    <p v-if="showWinner">
      ID Ganador: {{ lastWinnerId }}
    </p>
    <monkey-list
      :monkey-list="monkeys"
      :show-winner="showWinner"
      :last-winner-id="lastWinnerId"
    />
    <bet-button @bet="bet" />
  </div>
</template>
<script>

import getMonkeys from '../api/monkeys';
import postBet from '../api/bets';
import MonkeyList from './monkey-list';
import BetButton from './bet-button';

export default {
  props: {
    casinoId: {
      type: String,
      default: null,
    },
  },
  data() {
    return {
      monkeys: null,
      lastWinnerId: null,
      thereIsWinner: false,
      showWinner: false,
    };
  },
  mounted() {
    getMonkeys(this.casinoId).then((response) => (this.monkeys = response));
  },
  methods: {
    bet() {
      postBet(this.casinoId).then((response) => {
        this.thereIsWinner = true;
        this.showWinner = false;
        this.lastWinnerId = response.winner_id;
      });
    },
    showWinnerClick() {
      this.thereIsWinner = false;
      this.showWinner = true;
      getMonkeys(this.casinoId).then((response) => (this.monkeys = response));
    },
  },
  components: {
    'monkey-list': MonkeyList,
    'bet-button': BetButton,
  },
};
</script>

<style>
.winner {
  color: green
}
</style>
