import { shallow, createLocalVue } from 'vue-test-utils'
import Vuex from 'vuex'
import Item from '@/components/Item'

const localVue = createLocalVue()
localVue.use(Vuex)

describe('Item.vue', () => {
  let actions
  let store

  beforeEach(() => {
    actions = {
      addTask: jest.fn(),
      doneTask: jest.fn(),
    }
    store = new Vuex.Store({
      state: {},
      actions
    })
  })

  it('renders correctly', () => {
    const wrapper = shallow(Item, {
      propsData: {
        item: {
          is_done: true,
          title: 'Dummy Task'
        }
      }
    })
    expect(wrapper.vm.$el.textContent).toEqual('Dummy Task')
    expect(wrapper.vm.$el.className).toEqual('done')
  })

  it('has correct methods', () => {
    const wrapper = shallow(Item, {
      store,
      localVue,
      propsData: {
        item: {
          is_done: true,
          title: 'Dummy Task'
        }
      }
    })
    expect(typeof wrapper.vm.doneTask)
      .toEqual('function')
    const task = wrapper.find('li')
    expect(task.text()).toEqual('Dummy Task')
    task.trigger('click')
    expect(actions.doneTask).toHaveBeenCalled()
    task.trigger('click')
    expect(actions.doneTask).toHaveBeenCalled()
  })
})
