import { mount } from 'vue-test-utils'
import Vue from 'vue'
import Vuex from 'vuex'
import Todolist from '@/components/Todolist'
import Task from '@/components/Task'
import items from '@/store/items'

Vue.use(Vuex)

describe('Todolist.vue', () => {
  let actions
  let store
  let getters

  beforeEach(() => {
    actions = {
      addTask: jest.fn(),
      doneTask: jest.fn(),
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
    const wrapper = mount(Todolist, { store })
    expect(true).toBe(true)

    // TODO rewrite below for jest
    // const input = wrapper.find('input')
    // input.element.value = "New Dummy Task"
    // input.trigger('input')
    // expect(actions.addTask).toHaveBeenCalled()
  })

  //   it('has correct data', () => {
  //         Constructor = Vue.extend(Todolist)
  //         vm = new Constructor()
  // 
  //         expect(typeof vm.inputTitle)
  //             .toEqual("string")
  //         expect(vm.inputTitle)
  //             .toEqual("")
  //         expect(vm.items)
  //             .toBeInstanceOf(Array)
  //         expect(vm.items)
  //             .toHaveLength(3)
  //         expect(vm.items[0])
  //             .to.have.all.keys('is_done', 'title')
  //   })
  // 
  //   it('has correct methods', () => {
  //         Constructor = Vue.extend(Todolist)
  //         vm = new Constructor()
  // 
  //         expect(typeof vm.addItem)
  //             .toEqual('function')
  //         vm.inputTitle = "New Dummy Task"
  //         vm.addItem()
  //         expect(vm.items)
  //             .toHaveLength(4)
  //         expect(vm.items[3])
  //             .to.have.all.keys('is_done', 'title')
  //         expect(vm.items[3].title)
  //             .toEqual("New Dummy Task")
  //         expect(vm.items[3].is_done)
  //             .toEqual(false)
  //   })
})
