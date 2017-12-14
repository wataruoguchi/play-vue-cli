jest.mock('axios', () => ({
  get: jest.fn(() => Promise.resolve({
    data: [
      { "id": 1, "datasets": [{"label": "kpi 1", "data": "12"}, {"label": "kpi 2", "data": "13"}, {"label": "kpi 3", "data": "14"}, {"label": "kpi 4", "data": "15"}, {"label": "kpi 5", "data": "16"}]},
      { "id": 2, "datasets": [{"label": "kpi 1", "data": "12"}, {"label": "kpi 2", "data": "23"}, {"label": "kpi 3", "data": "34"}, {"label": "kpi 4", "data": "45"}, {"label": "kpi 5", "data": "56"}]}
    ]
  }))
}))
import { shallow } from 'vue-test-utils'
import Metrics from '@/components/Metrics'
import axios from 'axios'

describe('Metrics.vue', () => {
  beforeEach(() => {
    jest.resetModules()
    jest.clearAllMocks()
  })

  it('should render correct contents', () => {
    const wrapper = shallow(Metrics)
    expect(wrapper.find('.col-md-2.bg-success').text())
      .toContain('nav is here')
    expect(wrapper.find('.col-md-2.bg-success').text())
      .toEqual('nav is here')
  })

  it('should have correct data', () => {
    const wrapper = shallow(Metrics)
    expect(wrapper.vm.chkMain)
      .toEqual(true)
    expect(wrapper.vm.chkOptional)
      .toEqual(false)
    expect(wrapper.vm.polarData1).toEqual(null)
    expect(wrapper.vm.polarData2).toEqual(null)
    expect(wrapper.vm.radar1).toHaveProperty('datasets')
    expect(wrapper.vm.radar1).toHaveProperty('labels')
    expect(wrapper.vm.mainData)
      .toBeInstanceOf(Array)
    expect(wrapper.vm.mainData)
      .toHaveLength(2)
    expect(wrapper.vm.mainData[0])
      .toHaveProperty('label')
    expect(wrapper.vm.mainData[0])
      .toHaveProperty('borderColor')
    expect(wrapper.vm.mainData[0])
      .toHaveProperty('fill')
    expect(wrapper.vm.mainData[0])
      .toHaveProperty('pointRadius')
    expect(wrapper.vm.mainData[0])
      .toHaveProperty('data')
    expect(wrapper.vm.mainData[0]['label'])
      .toEqual('Data One')
    expect(wrapper.vm.datacollection)
      .toHaveProperty('labels')
    expect(wrapper.vm.datacollection)
      .toHaveProperty('datasets')
    expect(wrapper.vm.datacollection.labels)
      .toHaveLength(50)
    expect(typeof wrapper.vm.datacollection.labels[0])
      .toEqual('number')
    expect(wrapper.vm.datacollection.datasets)
      .toBeInstanceOf(Array)
    expect(wrapper.vm.datacollection.datasets)
      .toHaveLength(2)
    expect(wrapper.vm.datacollection.datasets)
      .toEqual(wrapper.vm.mainData)
  })

  it('should have correct methods', () => {
    const wrapper = shallow(Metrics)
    expect(typeof wrapper.vm.getPolarData)
        .toEqual('function')
    expect(typeof wrapper.vm.array50)
        .toEqual('function')
    expect(wrapper.vm.array50())
        .toHaveLength(50)
    expect(typeof wrapper.vm.fillData)
        .toEqual('function')
  })

  it('should receive asynchronous data', async () => {
    const wrapper = shallow(Metrics)
    const result = await wrapper.vm.getPolarData()
    expect(wrapper.vm.polarData1.datasets).toBeInstanceOf(Array)
    expect(wrapper.vm.polarData1.datasets).toHaveLength(1)
    expect(wrapper.vm.polarData1.datasets[0].borderColor).toEqual("rgba(201,203,207,0.5)")
    expect(wrapper.vm.polarData1.datasets[0].backgroundColor).toHaveLength(5)
    expect(wrapper.vm.polarData1.datasets[0].backgroundColor[0]).toEqual("rgba(255,99,132,0.5)")
    expect(wrapper.vm.polarData1.datasets[0].fill).toEqual(false)
    expect(wrapper.vm.polarData1.datasets[0].data).toHaveLength(5)
    expect(typeof wrapper.vm.polarData1.datasets[0].data[0]).toEqual("string")
    expect(wrapper.vm.polarData1.datasets[0].data[0]).toEqual("12")
    expect(wrapper.vm.polarData1.labels).toBeInstanceOf(Array)
    expect(wrapper.vm.polarData1.labels).toHaveLength(5)
    expect(typeof wrapper.vm.polarData1.labels[0]).toEqual('string')
    expect(wrapper.vm.polarData1.labels[0]).toEqual('kpi 1')
  })
})
