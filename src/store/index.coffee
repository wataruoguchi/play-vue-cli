import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export default new Vuex.Store
    state:
        items: [
            {
                is_done: false
                title: 'Task 1'
            }
            {
                is_done: true
                title: 'Task 2'
            }
            {
                is_done: false
                title: 'Task 3'
            }
        ]
    actions:
        addTask: ({commit}, title) ->
            newItem =
                title: title
                is_done: false
            commit 'addTask', data: newItem
        doneTask: ({commit}, item) ->
            commit 'doneTask', data: item
    mutations:
        addTask: (state, payload) ->
            state.items.push(payload.data)
        doneTask: (state, payload) ->
            index = state.items.indexOf(payload.data)
            state.items[index].is_done = !payload.data.is_done
