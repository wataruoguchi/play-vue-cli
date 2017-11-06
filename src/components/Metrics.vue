<template>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 bg-success">
                nav is here
            </div>
            <div class="col-md-10 text-left">
                <div class="row">
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-xs-12">
                                <label>
                                    <input type="checkbox" v-model="chkMain"> Main graphs
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label>
                                    <input type="checkbox" v-model="chkOptional"> Optional graphs
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <line-chart
                            :options="options"
                            :chart-data="datacollection"
                            :height="150"></line-chart>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <horizontal-bar
                            :options="options"
                            :chart-data="barData"
                            :height="150"></horizontal-bar>
                    </div>
                    <div class="col-md-6">
                        <pie-chart
                            :options="options"
                            :chart-data="pieData"
                            :height="150"></pie-chart>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script lang="coffee">
import LineChart from './LineChart.coffee'
import PieChart from './PieChart.coffee'
import HorizontalBar from './HorizontalBar.coffee'

export default
    name: 'Metrics'
    components:
        LineChart: LineChart
        PieChart: PieChart
        HorizontalBar: HorizontalBar
    data: () ->
        chkMain: true
        chkOptional: false
        barData:
            datasets: [
                label: 'Stars'
                data: [@getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt()]
            ]
            labels: [
                5,4,3,2,1
            ]
        pieData:
            # We could use this - https://github.com/emn178/Chart.PieceLabel.js
            datasets: [
                data: [@getRandomInt(), @getRandomInt(), @getRandomInt()]
                backgroundColor: [
                    '#f82221'
                    '#3243ff'
                    '#f82ff1'
                ]
            ]
            labels: [
                'red'
                'blue'
                'pink'
            ]
        optionalData: [
                {
                    label: 'Optional Data'
                    borderColor: '#f82279'
                    fill: false
                    pointRadius: 1
                    data: @array50().map (d) => @getRandomInt()
                }
            ]
        mainData: [
                {
                    label: 'Data One'
                    borderColor: '#f87979'
                    fill: false
                    pointRadius: 1
                    data: @array50().map (d) => @getRandomInt()
                }
                {
                    label: 'Data Two'
                    borderColor: '#43ff77'
                    fill: false
                    pointRadius: 1
                    data: @array50().map (d) => @getRandomInt()
                }
            ]
        datacollection: null
        options:
            responsive: true
            tooltips:
                position: 'nearest'
                mode: 'index'
                intersect: false
    mounted: () ->
        @fillData()
    watch:
        chkMain: () ->
            @fillData()
        chkOptional: () ->
            @fillData()
    methods:
        array50: () ->
            (0 for x in [0..50])
        fillData: () ->
            @datacollection =
                labels: @array50().map (d, i) -> i
                datasets: []
            if @chkMain
                @datacollection.datasets = @datacollection.datasets.concat @mainData
            if @chkOptional
                @datacollection.datasets = @datacollection.datasets.concat @optionalData
        getRandomInt: () ->
            Math.floor(Math.random() * (50 - 5 + 1)) + 5
</script>

<style scoped src="bootstrap3/dist/css/bootstrap.min.css"></style>
<style lang="scss">
.logo {
    display: none;
}
</style>
