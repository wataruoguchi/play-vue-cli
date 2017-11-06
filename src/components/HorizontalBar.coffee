# Making Line of vue-chartjs reactive
# http://vue-chartjs.org/#/home?id=reactive-data
import { HorizontalBar, mixins } from 'vue-chartjs'
{ reactiveProp } = mixins

export default
    extends: HorizontalBar
    mixins: [reactiveProp]
    props: ['options']
    mounted: () ->
        @renderChart @chartData, @options
