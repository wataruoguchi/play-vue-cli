# Making Line of vue-chartjs reactive
# http://vue-chartjs.org/#/home?id=reactive-data
import { PolarArea, mixins } from 'vue-chartjs'
{ reactiveProp } = mixins

export default
    extends: PolarArea
    mixins: [reactiveProp]
    props: ['options']
    mounted: () ->
        @renderChart @chartData, @options
