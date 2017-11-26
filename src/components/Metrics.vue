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
                            :chart-data="polarData1"
                            :height="150"></polar-area>
                    </div>
                    <div class="col-md-6">
                        <polar-area
                            :options="options"
                            :chart-data="polarData2"
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
import axios from 'axios'
import LineChart from './LineChart.coffee'
import PieChart from './PieChart.coffee'
import HorizontalBar from './HorizontalBar.coffee'
import RadarChart from './RadarChart.coffee'
import PolarArea from './PolarArea.coffee'
import Color from './Color.coffee'

export default
    name: 'Metrics'
    mixins: [Color]
    components:
        LineChart: LineChart
        PieChart: PieChart
        HorizontalBar: HorizontalBar
        RadarChart: RadarChart
        PolarArea: PolarArea
    data: () ->
        chkMain: true
        chkOptional: false
        polarData1: null
        polarData2: null
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
        @getPolarData()
    watch:
        chkMain: () ->
            @fillData()
        chkOptional: () ->
            @fillData()
    methods:
        getPolarData: () ->
            axios.get('api/polardata').then (res) =>
                polarData = res.data.map (d) =>
                    datasets: [
                        borderColor: @color('grey').rgba()
                        backgroundColor: [
                            @color('red').rgba()
                            @color('orange').rgba()
                            @color('yellow').rgba()
                            @color('green').rgba()
                            @color('blue').rgba()
                        ]
                        fill: false
                        data: d.datasets.map (ds) ->
                            ds.data
                    ]
                    labels: d.datasets.map (ds) ->
                        ds.label
                @polarData1 = polarData[0]
                @polarData2 = polarData[1]
            .catch (e) ->
                @errors.push e
        array50: () ->
            (0 for x in [0..49])
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
