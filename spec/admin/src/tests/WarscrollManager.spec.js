import Vue from 'vue';
import WarscrollManager from '@/WarscrollManager.vue'

describe('WarscrollManager.vue', () => {
  it('should render the warscroll name', () => {
    const warscroll = { 'name': 'Liberators' }

    const Constructor = Vue.extend(WarscrollManager);
    const vm = new Constructor({ propsData: { warscroll: warscroll } }).$mount();

    expect(vm.$el.querySelector('h1').textContent)
      .to.equal('Liberators')
  });
});
