<template>
  <div>
    <button
      v-if="thereIsWinner"
      @click="showWinnerClick"
    >
      Mostrar ganador
    </button>
    <p v-if="showWinner">
      ID Ganador: {{ lastWinnerId }}
    </p>
  </div>
</template>
<script>
export default {
  name: 'Winner',
  props: {
    showWinner: {
      type: Boolean,
      default: false,
    },
    thereIsWinner: {
      type: Boolean,
      default: false,
    },
    lastWinnerId: {
      type: Number,
      default: null,
    },
  },
  methods: {
    showWinnerClick() {
      this.$emit('show-winner-click');
    },
  },

};
</script>
