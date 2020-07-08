<template>
  <div>
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
          v-for="monkey in monkeyList"
          :key="monkey.id"
          :class="{ winner: monkey.id == lastWinnerId && showWinner }"
        >
          <td>{{ monkey.id }}</td>
          <td>{{ monkey.name }}</td>
          <td>{{ monkey.bananas }}</td>
          <td> {{ monkey.id == lastWinnerId && showWinner ? '🎉🎉🎉': '' }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
export default {
  name: 'MonkeyList',
  props: {
    monkeyList: {
      type: Array,
      default: null,
    },
    showWinner: {
      type: Boolean,
      default: false,
    },
    lastWinnerId: {
      type: Number,
      default: null,
    },
  },

};
</script>
