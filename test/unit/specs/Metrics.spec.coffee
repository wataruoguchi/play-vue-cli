import Vue from 'vue'
import Metrics from '@/components/Metrics'
import sinon from 'sinon'
import axios from 'axios'
import Promise from 'bluebird'

describe 'Metrics.vue', () ->
    it 'should render correct contents', () ->
        Constructor = Vue.extend(Metrics)
        vm = new Constructor().$mount()

        expect(vm.$el.querySelector('.col-md-2.bg-success').textContent)
            .to.contain('nav is here')
        expect(vm.$el.querySelector('.col-md-2.bg-success').textContent)
            .to.not.equal('nav is here') # because it contains spaces and \n

    it 'should have correct data', () ->
        Constructor = Vue.extend(Metrics)
        vm = new Constructor().$mount()

        expect(vm.chkMain)
            .to.equal(true)
        expect(vm.chkOptional)
            .to.equal(false)
        expect(vm.polarData1).to.equal(null)
        expect(vm.polarData2).to.equal(null)
        expect(vm.radar1).to.have.all.keys('datasets', 'labels')
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

    it 'should have correct methods', () ->
        Constructor = Vue.extend(Metrics)
        vm = new Constructor().$mount()

        expect(typeof vm.getPolarData)
            .to.equal('function')
        expect(typeof vm.array50)
            .to.equal('function')
        expect(vm.array50())
            .to.have.lengthOf(50)
        expect(typeof vm.fillData)
            .to.equal('function')

    it 'should receive asynchronous data', (done) ->
        # Test async
        polardata = [
            { "id": 1, "datasets": [{"label": "kpi 1", "data": "12"}, {"label": "kpi 2", "data": "13"}, {"label": "kpi 3", "data": "14"}, {"label": "kpi 4", "data": "15"}, {"label": "kpi 5", "data": "16"}]},
            { "id": 2, "datasets": [{"label": "kpi 1", "data": "12"}, {"label": "kpi 2", "data": "23"}, {"label": "kpi 3", "data": "34"}, {"label": "kpi 4", "data": "45"}, {"label": "kpi 5", "data": "56"}]}
        ]
        resolved = new Promise.resolve(data: polardata)
        # Make a stub for axios, the axios API in the code won't be executed
        stub = sinon.stub(axios, 'get').returns(resolved)

        Constructor = Vue.extend(Metrics)
        vm = new Constructor()

        vm.getPolarData()
        resolved.then(() ->
            expect(vm.polarData1.datasets).to.be.an.instanceof(Array)
            expect(vm.polarData1.datasets).to.have.lengthOf(1)
            expect(vm.polarData1.datasets[0].borderColor).to.equal("rgba(201,203,207,0.5)")
            expect(vm.polarData1.datasets[0].backgroundColor).to.have.lengthOf(5)
            expect(vm.polarData1.datasets[0].backgroundColor[0]).to.equal("rgba(255,99,132,0.5)")
            expect(vm.polarData1.datasets[0].fill).to.equal(false)
            expect(vm.polarData1.datasets[0].data).to.have.lengthOf(5)
            expect(typeof vm.polarData1.datasets[0].data[0]).to.equal("string")
            expect(vm.polarData1.datasets[0].data[0]).to.equal("12")

            expect(vm.polarData1.labels).to.be.an.instanceof(Array)
            expect(vm.polarData1.labels).to.have.lengthOf(5)
            expect(typeof vm.polarData1.labels[0]).to.equal('string')
            expect(vm.polarData1.labels[0]).to.equal('kpi 1')
            done()
        ).catch done
        return # WARNING: This is coffeescript, we have to NOT return resolved explicitly
