<template>
  <div>
    <h1>Casinos</h1>
    <table>
      <tr>
        <th>
          ID
        </th>
        <th>
          Nombre
        </th>
        <th>
          Link
        </th>
      </tr>
      <tbody>
        <tr
          v-for="casino in casinos"
          :key="casino.id"
        >
          <td>{{ casino.id }}</td>
          <td>{{ casino.name }}</td>
          <td><a :href="`/casinos/${casino.id}`">Ver</a></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>

import { mapState } from 'vuex';

export default {
  computed: mapState([
    'casinos',
  ]),
  mounted() {
    this.$store.dispatch('getCasinosAction');
  },
};
</script>
