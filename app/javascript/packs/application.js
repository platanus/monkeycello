import Vue from 'vue/dist/vue.esm';
import CasinoForm from '../components/casino-form.vue';
import '../css/application.css';

document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('app')) {
    return new Vue({
      el: '#app',
      data: {
        message: 'Victoria!',
      },
      components: { CasinoForm },
    });
  }

  return null;
});
