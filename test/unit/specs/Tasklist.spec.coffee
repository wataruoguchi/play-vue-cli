import Vue from 'vue'
import Tasklist from '@/components/Tasklist'

describe 'Tasklist.vue', () ->
    it 'should render correctly', () ->
        Constructor = Vue.extend(Tasklist)
        vm = new Constructor().$mount()

        expect(vm.$el.querySelector('button').textContent)
            .to.equal('Add')
        expect(vm.$el.querySelector('li:nth-of-type(1)').textContent)
            .to.equal('Task 1')

    it 'should have correct data', () ->
        Constructor = Vue.extend(Tasklist)
        vm = new Constructor()

        expect(typeof vm.inputTitle)
            .to.equal("string")
        expect(vm.inputTitle)
            .to.equal("")
        expect(vm.items)
            .to.be.an.instanceof(Array)
        expect(vm.items)
            .to.have.lengthOf(3)
        expect(vm.items[0])
            .to.have.all.keys('is_done', 'title')

    it 'should have correct methods', () ->
        Constructor = Vue.extend(Tasklist)
        vm = new Constructor()

        expect(typeof vm.addItem)
            .to.equal('function')
        vm.inputTitle = "New Dummy Task"
        vm.addItem()
        expect(vm.items)
            .to.have.lengthOf(4)
        expect(vm.items[3])
            .to.have.all.keys('is_done', 'title')
        expect(vm.items[3].title)
            .to.equal("New Dummy Task")
        expect(vm.items[3].is_done)
            .to.equal(false)
