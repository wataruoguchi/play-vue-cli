<template>
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-xs-offset-3">
                <ul>
                    <item v-for="item in items" :item="item" :key="item.id"></item>
                </ul>
                <div>
                    <input type="text" v-model="inputTitle">
                    <button @click="addTask(inputTitle)">Add</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script lang="coffee">
import Item from './Item.vue'
import { mapState } from 'vuex'
import { mapActions } from 'vuex'
import Store from '../store/index.coffee'

export default
    name: 'Tasklist'
    store: Store
    components:
        Item: Item
    data: () ->
        inputTitle: ""
    computed:
        mapState(['items'])
    methods:
        mapActions(['addTask'])
</script>

<style src="bootstrap3/dist/css/bootstrap.min.css"></style>
