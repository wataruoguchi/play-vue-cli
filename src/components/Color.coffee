export default
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
