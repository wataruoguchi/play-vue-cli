<template>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 bg-success">
                nav is here
            </div>
            <div class="col-md-10 text-left">
                <div class="row">
                    <polar-area
                        :options="options"
                        :chart-data="polarData"
                        :height="100"></polar-area>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <radar-chart
                            :options="radarOptions"
                            :chart-data="radar1"
                            :height="300"></radar-chart>
                    </div>
                    <div class="col-md-4">
                        <radar-chart
                            :options="radarOptions"
                            :chart-data="radar2"
                            :height="300"></radar-chart>
                    </div>
                    <div class="col-md-4">
                        <radar-chart
                            :options="radarOptions"
                            :chart-data="radar3"
                            :height="300"></radar-chart>
                    </div>
                </div>
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
import RadarChart from './RadarChart.coffee'
import PolarArea from './PolarArea.coffee'

export default
    name: 'Metrics'
    components:
        LineChart: LineChart
        PieChart: PieChart
        HorizontalBar: HorizontalBar
        RadarChart: RadarChart
        PolarArea: PolarArea
    data: () ->
        chkMain: true
        chkOptional: false
        polarData:
            datasets: [
                {
                    borderColor: '#44ff32'
                    backgroundColor: [
                        '#f82221'
                        '#3243ff'
                        '#f82ff1'
                        '#44ff32'
                        '#f4f123'
                    ]
                    data: [@getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt()]
                    fill: false
                }
            ]
            labels: ["kpi1", "kpi2", "kpi3", "kpi4", "kpi5"]
        radar1:
            datasets: [
                {
                    borderColor: '#44ff32'
                    label: 'Stat 1'
                    data: [@getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt()]
                    fill: false
                }
                {
                    borderColor: '#f4f132'
                    label: 'Stat 1.5'
                    data: [@getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt()]
                    fill: false
                }
            ]
            labels: ["kpi1", "kpi2", "kpi3", "kpi4", "kpi5"]
        radar2:
            datasets: [
                backgroundColor: '#ff4432'
                label: 'Stat 2'
                data: [@getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt()]
            ]
            labels: ["kpi1", "kpi2", "kpi3", "kpi4", "kpi5"]
        radar3:
            datasets: [
                backgroundColor: '#333244'
                label: 'Stat 3'
                data: [@getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt()]
            ]
            labels: ["kpi1", "kpi2", "kpi3", "kpi4", "kpi5"]
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
        radarOptions:
            scale:
                ticks:
                    beginAtZero: true
            maintainAspectRatio: true
            spanGaps: false
            elements:
                line:
                    tention: 0.00001
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
