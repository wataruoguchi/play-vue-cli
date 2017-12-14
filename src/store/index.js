import Vue from 'vue'
import Vuex from 'vuex'
import items from './items.coffee'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    items,
  }
})
