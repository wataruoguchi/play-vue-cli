import Vue from 'vue'
import Item from '@/components/Item'

describe 'Item.vue', () ->
    it 'should render correctly', () ->
        Constructor = Vue.extend(Item)
        vm = new Constructor(propsData:
            item:
                is_done: true
                title: 'Dummy Task'
        ).$mount()
        expect(vm.$el.textContent).to.equal('Dummy Task')
        expect(vm.$el.className).to.equal('done')

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
