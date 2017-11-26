import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Metrics from '@/components/Metrics'
import Tasklist from '@/components/Tasklist'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Hello',
      component: HelloWorld
    },
    {
      path: '/metrics',
      name: 'Metrics',
      component: Metrics
    },
    {
      path: '/todo-app',
      name: 'Tasklist',
      component: Tasklist
    },
  ]
})
