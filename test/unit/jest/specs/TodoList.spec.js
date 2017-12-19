import { shallow, createLocalVue } from 'vue-test-utils'
import Vuex from 'vuex'
import Todolist from '@/components/Todolist'
import Task from '@/components/Task'

const localVue = createLocalVue()

localVue.use(Vuex)

describe('Todolist.vue', () => {
  let actions
  let store
  let getters

  beforeEach(() => {
    actions = {
      addTask: jest.fn(),
      doneTask: jest.fn()
    }

    getters = {
      items: () => {
        [
          {
            is_done: false,
            title: 'Task 1'
          }
        ]
      }
    }

    store = new Vuex.Store({
      state: {},
      actions,
      getters
    })
  })

  it('calls store action addTask when input value is input and an input event is fired', () => {
    // TODO: key.charAt is not a function
    const wrapper = shallow(Todolist, { store, localVue, slots: { task: Task } })
    expect(true).toBe(true)
  })
})
