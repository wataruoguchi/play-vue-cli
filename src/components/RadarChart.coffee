# Making Line of vue-chartjs reactive
# http://vue-chartjs.org/#/home?id=reactive-data
import { Radar, mixins } from 'vue-chartjs'
{ reactiveProp } = mixins

export default
    extends: Radar
    mixins: [reactiveProp]
    props: ['options']
    mounted: () ->
        @renderChart @chartData, @options
