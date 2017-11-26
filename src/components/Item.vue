<template>
    <li :class="{ 'done': item.is_done }" @click="done(item)">{{item.title}}</li>
</template>

<script lang="coffee">
export default
    props: ['item']
    methods:
        done: (item) ->
            item.is_done = !item.is_done
</script>

<style lang="scss" scoped>
li {
    cursor: pointer;
    &.done {
        text-decoration: line-through;
    }
}
</style>
