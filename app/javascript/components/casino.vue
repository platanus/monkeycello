<template>
  <div>
    <h1>Casino component</h1>
    {{ monkeys }}
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
      .then(response => (this.monkeys = response.data.data));
  },
  methods: {
  },
};
</script>
