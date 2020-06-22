<template>
  <div>
    <h1>Casino component</h1>
    <button
      v-if="thereIsWinner"
      @click="showWinnerClick"
    >
      Mostrar ganador
    </button>
    {{ this.monkeys }}
    <p v-if="showWinner">
      ID Ganador: {{ lastWinner }}
    </p>
    <button @click="bet">
      Apostar
    </button>
    <table>
      <tr>
        <th>
          ID
        </th>
        <th>
          Nombre
        </th>
        <th>
          Bananas
        </th>
      </tr>
      <tbody>
        <tr
          v-for="monkey in monkeys"
          :key="monkey.id"
        >
          <td>{{ monkey.id }}</td>
          <td>{{ monkey.name }}</td>
          <td>{{ monkey.bananas }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
import getMonkeys from '../api/monkeys';
import postBet from '../api/bets';

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
      lastWinner: null,
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
        this.lastWinner = response.winner_id;
      });
    },
    showWinnerClick() {
      this.thereIsWinner = false;
      this.showWinner = true;
      getMonkeys(this.casinoId).then((response) => (this.monkeys = response));
    },
  },
};
</script>
