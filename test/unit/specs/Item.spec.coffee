import Vue from 'vue'
import Item from '@/components/Item'

getRenderedText = (Component, propsData) ->
    Ctor = Vue.extend(Component)
    vm = new Ctor(propsData: propsData).$mount()
    return vm.$el.textContent

describe 'Item.vue', () ->
    it 'should render correctly', () ->
        expect(getRenderedText(Item,
            item:
                is_done: true
                title: 'Dummy Task'
        )).to.equal('Dummy Task')

    it 'should have correct methods', () ->
        Constructor = Vue.extend(Item)
        vm = new Constructor()
        expect(typeof vm.done)
            .to.equal('function')
        item = {is_done: false}
        vm.done(item)
        expect(item.is_done)
            .to.equal(true)
        vm.done(item)
        expect(item.is_done)
            .to.equal(false)
