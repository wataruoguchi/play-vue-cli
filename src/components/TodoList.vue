<template>
  <div class="container">
    <div class="row">
      <div class="col-xs-6 col-xs-offset-3">
        <ul>
          <task v-for="item in items" :item="item" :key="item.id"></task>
        </ul>
        <div>
          <input type="text" v-model="inputTitle">
          <button @click="addTask(inputTitle)">Add</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Task from './Task.vue'
import { mapActions, mapGetters } from 'vuex'
import store from '../store/index'

export default {
  name: 'Tasklist',
  store,
  components: {
    Task
  },
  data: function () {
    return {
      inputTitle: ""
    }
  },
  computed: {
    ...mapGetters(['items'])
  },
  methods: {
    ...mapActions(['addTask'])
  }
}
</script>

<style src="bootstrap3/dist/css/bootstrap.min.css"></style>
