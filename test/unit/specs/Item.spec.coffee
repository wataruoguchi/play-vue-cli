import { shallow, createLocalVue } from 'vue-test-utils'
import Vuex from 'vuex'
import sinon from 'sinon'
import Item from '@/components/Item'

localVue = createLocalVue()
localVue.use(Vuex)

describe 'Item.vue', () ->
  actions = null
  store = null

  beforeEach(() ->
    actions =
      addTask: sinon.stub()
      doneTask: sinon.stub()
    store = new Vuex.Store(
      state: {}
      actions: actions
    )
  )

  it 'renders correctly when is_done is false', () ->
    wrapper = shallow(Item, {
      propsData:
        item:
          is_done: false
          title: 'Dummy Task'
    })
    expect(wrapper.vm.$el.textContent).to.equal('Dummy Task')
    expect(wrapper.vm.$el.className).to.not.equal('done')

  it 'renders correctly when is_done is true', () ->
    wrapper = shallow(Item, {
      propsData:
        item:
          is_done: true
          title: 'Dummy Task'
    })
    expect(wrapper.vm.$el.textContent).to.equal('Dummy Task')
    expect(wrapper.vm.$el.className).to.equal('done')

  it 'has correct methods', () ->
    wrapper = shallow(Item, {
      store,
      localVue,
      propsData: {
        item:
          is_done: false
          title: 'Dummy Task'
      }
    })
    expect(typeof wrapper.vm.doneTask).to.equal('function')
    task = wrapper.find('li')
    expect(task.text()).to.equal('Dummy Task')
    expect(task.hasClass('done')).to.equal(false)
    task.trigger('click')
    expect(actions.doneTask.calledOnce).to.equal(true)
    task.trigger('click')
    expect(actions.doneTask.calledTwice).to.equal(true)
