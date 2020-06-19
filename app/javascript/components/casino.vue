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
          <td>{{ monkey.attributes.name }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
import axios from 'axios';

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
    axios
      .get(`/api/v1/casinos/${this.casinoId}/monkeys`)
      .then((response) => (this.monkeys = response.data.data));
  },
  methods: {
  },
};
</script>
