<template>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 bg-success">
                nav is here
            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-9">
                        <line-chart
                            :options="options"
                            :chart-data="datacollection"
                            :height="150"></line-chart>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script lang="coffee">
import LineChart from './LineChart.coffee'

export default
    name: 'Metrics'
    components:
        LineChart: LineChart
    data: () ->
        datacollection: null
        options:
            responsive: true
            tooltips:
                position: 'nearest'
                mode: 'index'
                intersect: false
    mounted: () ->
        @fillData()
    methods:
        fillData: () ->
            array50 = (0 for x in [0..50])
            @datacollection =
                labels: array50.map (d, i) -> i
                datasets: [
                    {
                        label: 'Data One'
                        borderColor: '#f87979'
                        fill: false
                        pointRadius: 1
                        data: array50.map (d) => @getRandomInt()
                    }
                    {
                        label: 'Data Two'
                        borderColor: '#43ff77'
                        fill: false
                        pointRadius: 1
                        data: array50.map (d) => @getRandomInt()
                    }
                ]
        getRandomInt: () ->
            Math.floor(Math.random() * (50 - 5 + 1)) + 5
</script>

<style scoped src="bootstrap3/dist/css/bootstrap.min.css"></style>
<style lang="scss">
.logo {
    display: none;
}
</style>
