# Making Line of vue-chartjs reactive
# http://vue-chartjs.org/#/home?id=reactive-data
import { Pie, mixins } from 'vue-chartjs'
{ reactiveProp } = mixins

export default
    extends: Pie
    mixins: [reactiveProp]
    props: ['options']
    mounted: () ->
        @renderChart @chartData, @options
