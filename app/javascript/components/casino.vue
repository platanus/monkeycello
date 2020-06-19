<template>
  <div>
    <h1>Casino component</h1>
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
    };
  },
  mounted() {
    getMonkeys(this.casinoId).then((response) => (this.monkeys = response));
  },
  methods: {
  },
};
</script>
