<template>
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-xs-offset-3">
                <ul>
                    <item v-for="item in items" :item="item" :key="item.id"></item>
                </ul>
                <div>
                    <input type="text" v-model="inputTitle">
                    <button @click="addItem">Add</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script lang="coffee">
import Item from './Item.vue'

export default
    name: 'Tasklist'
    components:
        Item: Item
    data: () ->
        inputTitle: ""
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
    methods:
        addItem: () ->
            @items.push
                title: @inputTitle
                is_done: false
</script>

<style src="bootstrap3/dist/css/bootstrap.min.css"></style>
