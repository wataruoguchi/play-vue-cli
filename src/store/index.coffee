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
