<template>
  <div>
    <button @click="bet">
      Apostar
    </button>
  </div>
</template>
<script>
export default {
  name: 'BetButton',
  methods: {
    bet() {
      this.$emit('bet');
    },
  },

};
</script>
