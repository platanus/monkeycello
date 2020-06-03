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
      v-model="casinoForm.monkeys"
    >
    <label for="bananas">Bananas iniciales</label>
    <input
      id="bananas"
      type="number"
      v-model="casinoForm.bananas"
    >
    <button @click="createCasino">
      Crear
    </button>
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
    };
  },
  methods: {
    createCasino() {
      console.log('Me clickearon');
    },
  },
};
</script>
