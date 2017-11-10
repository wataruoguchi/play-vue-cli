import Vue from 'vue'
import Metrics from '@/components/Metrics'

describe 'Metrics.vue', () ->
    it 'should render correct contents', () ->
        Constructor = Vue.extend(Metrics)
        vm = new Constructor().$mount()
        expect(vm.$el.querySelector('.col-md-2.bg-success').textContent)
            .to.contain('nav is here')
        expect(vm.$el.querySelector('.col-md-2.bg-success').textContent)
            .to.not.equal('nav is here') # because it contains spaces and \n
    it 'should have correct data after mounted', () ->
        # TODO cannot call like this because of mixins. Do we have to mount?
        # defaultData = Metrics.data()
        Constructor = Vue.extend(Metrics)
        vm = new Constructor().$mount()
        expect(vm.chkMain)
            .to.equal(true)
        expect(vm.chkOptional)
            .to.equal(false)
        # @color has been set
        expect(vm.mainData)
            .to.be.an.instanceof(Array)
        expect(vm.mainData)
            .to.have.lengthOf(2)
        expect(vm.mainData[0])
            .to.have.all.keys('label', 'borderColor', 'fill', 'pointRadius', 'data')
        expect(vm.mainData[0]['label'])
            .to.equal('Data One')
        # fillData is executed when $mount()
        expect(vm.datacollection)
            .to.have.all.keys('labels', 'datasets')
        expect(vm.datacollection.labels)
            .to.have.lengthOf(50)
        expect(typeof vm.datacollection.labels[0])
            .to.equal('number')
        expect(vm.datacollection.datasets)
            .to.be.an.instanceof(Array)
        expect(vm.datacollection.datasets)
            .to.have.lengthOf(2)
        expect(vm.datacollection.datasets)
            .to.eql(vm.mainData) # Asserts that the target is deeply equal to the given obj
    it 'should have correct methods initialized', () ->
        Constructor = Vue.extend(Metrics)
        vm = new Constructor().$mount()
        expect(typeof vm.array50)
            .to.equal('function')
        expect(vm.array50())
            .to.have.lengthOf(50)
        # TODO How can we test async?
        expect(typeof vm.getPolarData)
            .to.equal('function')
        expect(vm.polarData1)
            .to.equal(null)
        expect(vm.polarData2)
            .to.equal(null)
