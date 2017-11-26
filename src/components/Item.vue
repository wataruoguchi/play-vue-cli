<template>
    <li :class="{ 'done': item.is_done }" @click="doneTask(item)">{{item.title}}</li>
</template>

<script lang="coffee">
import { mapActions } from 'vuex'

export default
    props: ['item']
    methods:
        mapActions(['doneTask'])
</script>

<style lang="scss" scoped>
li {
    cursor: pointer;
    &.done {
        text-decoration: line-through;
    }
}
</style>
