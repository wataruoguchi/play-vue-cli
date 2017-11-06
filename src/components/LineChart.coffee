# Making Line of vue-chartjs reactive
# http://vue-chartjs.org/#/home?id=reactive-data
import { Line, mixins } from 'vue-chartjs'
{ reactiveProp } = mixins

export default
    extends: Line
    mixins: [reactiveProp]
    props: ['options']
    mounted: () ->
        @renderChart @chartData, @options
