import Vue from 'vue/dist/vue.esm';
import '../css/application.css';
import Casino from '../components/casino.vue';
import store from './store';

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    store,
    el: '#app',
    data: {
      message: 'Victoria!',
    },
    components: { Casino },
  });

  return app;
});
