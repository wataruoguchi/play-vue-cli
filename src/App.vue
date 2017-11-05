<template>
  <div id="app">
    <img src="./assets/logo.png" class="logo">
    <router-view/>
  </div>
</template>

<script lang="coffee">
export default
  name: 'app'
</script>

<style lang="scss">
#app {
    .logo {
        width: 10px;
        height: auto;
    }
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
}
</style>
