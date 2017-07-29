import Vue from 'vue';
import WarscrollManager from './WarscrollManager.vue'

new Vue({
  el: '.warscroll-manager',
  data: { warscroll: null },
  template: '<warscroll-manager :warscroll="warscroll"/>',
  components: { WarscrollManager },
  beforeMount: function() {
    this.warscroll = window.vueData.warscroll;
  },
});
