import Vue from 'vue/dist/vue.esm';
import App from '../app.vue';
import '../css/application.css';

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#vue-app',
    data: {
      message: 'Victoria!',
    },
    components: { App },
  });

  return app;
});
