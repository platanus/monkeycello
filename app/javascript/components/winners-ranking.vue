<template>
  <div>
    <h3>Ranking de ganadores</h3>
    <button @click="updateRanking">
      Actualizar ranking
    </button>
    <table>
      <tr>
        <th>
          Casino id
        </th>
        <th>
          Monkey
        </th>
        <th>
          Bananas
        </th>
      </tr>
      <tbody>
        <tr
          v-for="monkey in topTen"
          :key="monkey.id"
        >
          <td>{{ monkey.casino_id }}</td>
          <td>{{ monkey.name }}</td>
          <td>{{ monkey.bananas }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
import { mapState } from 'vuex';

export default {
  name: 'WinnersRanking',
  computed: mapState([
    'topTen',
  ]),
  mounted() {
    this.updateRanking();
  },
  methods: {
    updateRanking() {
      this.$store.dispatch('updateTopTen');
    },

  },
};
</script>
