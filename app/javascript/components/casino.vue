<template>
  <div>
    <h1>Casino component</h1>
    <winner
      @show-winner-click="showWinnerClick"
      :show-winner="showWinner"
      :there-is-winner="thereIsWinner"
      :last-winner-id="lastWinnerId"
    />
    <monkey-list
      :monkey-list="monkeys"
      :show-winner="showWinner"
      :last-winner-id="lastWinnerId"
    />
    <bet-button @bet="bet" />
    <winners-ranking />
  </div>
</template>
<script>

import MonkeyList from './monkey-list';
import BetButton from './bet-button';
import Winner from './winner';
import WinnersRanking from './winners-ranking';
import { mapState } from 'vuex';

export default {
  props: {
    casinoId: {
      type: String,
      default: null,
    },
  },
  data() {
    return {
      thereIsWinner: false,
      showWinner: false,
    };
  },
  computed: mapState([
    'monkeys', 'lastWinnerId',
  ]),
  mounted() {
    this.$store.dispatch('getMonkeysFromApi', { casinoId: this.casinoId });
  },
  methods: {
    bet() {
      this.$store.dispatch('postBetFromApi', { casinoId: this.casinoId })
        .then(() => {
          this.thereIsWinner = true;
          this.showWinner = false;
        });
    },
    showWinnerClick() {
      this.thereIsWinner = false;
      this.showWinner = true;
      this.$store.dispatch('getMonkeysFromApi', { casinoId: this.casinoId });
    },
  },
  components: {
    MonkeyList,
    BetButton,
    Winner,
    WinnersRanking,
  },
};
</script>

<style>
.winner {
  color: green;
}
</style>
