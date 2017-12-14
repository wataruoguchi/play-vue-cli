export default
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

  mutations:
    ADD_TASK: (state, payload) ->
      state.items.push(payload.data)
    DONE_TASK: (state, payload) ->
      index = state.items.indexOf(payload.data)
      state.items[index].is_done = !payload.data.is_done

  actions:
    addTask: ({commit}, title) ->
      newItem =
        title: title
        is_done: false
      commit 'ADD_TASK', data: newItem
    doneTask: ({commit}, item) ->
      commit 'DONE_TASK', data: item

  getters:
    items: (state) -> state.items
