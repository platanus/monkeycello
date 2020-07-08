import Vue from 'vue/dist/vue.esm';
import '../css/application.css';
import Casino from '../components/casino.vue';

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    data: {
      message: 'Victoria!',
    },
    components: { Casino },
  });

  return app;
});
