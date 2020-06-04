<template>
  <div>
    <h1>Casino form component</h1>
    <h2> {{ title }} </h2>
    <label for="name">Nombre</label>
    <input
      id="name"
      v-model="casinoForm.name"
    >
    <label for="monkeys">Cantidad de monkeys</label>
    <input
      id="monkeys"
      type="number"
      min="0"
      v-model="casinoForm.monkeys"
    >
    <label for="bananas">Bananas iniciales</label>
    <input
      id="bananas"
      type="number"
      min="10"
      v-model="casinoForm.bananas"
    >
    <button @click="checkForm">
      Crear
    </button>
    <p v-if="error">
      Ponle un nombre al casino
    </p>
    {{ casinoForm.bananas }}
  </div>
</template>
<script>
export default {
  data() {
    return {
      title: 'Crear casino',
      casinoForm: {
        name: '',
        monkeys: '',
        bananas: '',
      },
      error: false,
    };
  },
  methods: {
    checkForm(e) {
      console.log('Me clickearon');
      if (this.casinoForm.name === '') {
        this.error = true;
      }
      e.preventDefault();
    },
  },
};
</script>
