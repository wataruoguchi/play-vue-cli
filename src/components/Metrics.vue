<template>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 bg-success">
                nav is here
            </div>
            <div class="col-md-10 text-left">
                <div class="row">
                    <div class="col-md-6">
                        <polar-area
                            :options="options"
                            :chart-data="polarData"
                            :height="150"></polar-area>
                    </div>
                    <div class="col-md-6">
                        <polar-area
                            :options="options"
                            :chart-data="polarData"
                            :height="150"></polar-area>
                    </div>
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
                    borderColor: @color('grey').rgba()
                    backgroundColor: [
                        @color('red').rgba()
                        @color('orange').rgba()
                        @color('yellow').rgba()
                        @color('green').rgba()
                        @color('blue').rgba()
                    ]
                    data: [@getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt()]
                    fill: false
                }
            ]
            labels: ["kpi1", "kpi2", "kpi3", "kpi4", "kpi5"]
        radar1:
            datasets: [
                {
                    borderColor: @color('red').rgba()
                    label: 'Stat 1'
                    data: [@getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt()]
                    fill: false
                }
                {
                    borderColor: @color('orange').rgba()
                    label: 'Stat 1.5'
                    data: [@getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt()]
                    fill: false
                }
            ]
            labels: ["kpi1", "kpi2", "kpi3", "kpi4", "kpi5"]
        radar2:
            datasets: [
                backgroundColor: @color('yellow').rgba()
                label: 'Stat 2'
                data: [@getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt(), @getRandomInt()]
            ]
            labels: ["kpi1", "kpi2", "kpi3", "kpi4", "kpi5"]
        radar3:
            datasets: [
                backgroundColor: @color('green').rgba()
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
                    @color('red').rgba()
                    @color('orange').rgba()
                    @color('yellow').rgba()
                ]
            ]
            labels: [
                'red'
                'orange'
                'yellow'
            ]
        optionalData: [
                {
                    label: 'Optional Data'
                    borderColor: @color('purple').rgba()
                    fill: false
                    pointRadius: 1
                    data: @array50().map (d) => @getRandomInt()
                }
            ]
        mainData: [
                {
                    label: 'Data One'
                    borderColor: @color('red').rgba()
                    fill: false
                    pointRadius: 1
                    data: @array50().map (d) => @getRandomInt()
                }
                {
                    label: 'Data Two'
                    borderColor: @color('orange').rgba()
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
        color: (name, alpha) ->
            COLORS =
                red: '#ff6384'
                orange: '#ff9f40'
                yellow: '#ffcd56'
                green: '#4bc0c0'
                blue: '#36a2eb'
                purple: '#9966ff'
                grey: '#c9cbcf'
            getRgba = (name) ->
                result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(COLORS[name])
                result = [result[1], result[2], result[3]]
                result.map((c) -> parseInt(c, 16)).join(',')
            return {
                hex: () -> COLORS[name]
                rgb: () ->
                    "rgb(#{getRgba(name)})"
                rgba: (alpha = 0.5) ->
                    "rgba(#{getRgba(name)},#{alpha})"
            }
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
