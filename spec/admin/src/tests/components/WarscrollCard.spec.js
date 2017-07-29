import Vue from 'vue';
import WarscrollCard from '@/components/WarscrollCard.vue'

describe('WarscrollCard.vue', () => {
  it('should render the warscroll details', () => {
    const army = {
      'grand_alliance_name': 'Order',
      'name': 'Stormcast Eternals'
    };
    const warscroll = {
      'name': 'Liberators',
      'army': army
    };

    const Constructor = Vue.extend(WarscrollCard);
    const vm = new Constructor({ propsData: { initialWarscroll: warscroll } }).$mount();

    expect(vm.$el.querySelector('h4').textContent)
      .to.equal('Liberators')

    expect(vm.$el.querySelector('#grand-alliance-name').textContent)
      .to.include('Order')

    expect(vm.$el.querySelector('#army-name').textContent)
      .to.include('Stormcast Eternals')
  });
});
