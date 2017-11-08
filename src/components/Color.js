// Generated by CoffeeScript 2.0.2
export default {
  methods: {
    color: function(name, alpha) {
      var COLORS, getRgba;
      COLORS = {
        red: '#ff6384',
        orange: '#ff9f40',
        yellow: '#ffcd56',
        green: '#4bc0c0',
        blue: '#36a2eb',
        purple: '#9966ff',
        grey: '#c9cbcf'
      };
      getRgba = function(name) {
        var result;
        result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(COLORS[name]);
        result = [result[1], result[2], result[3]];
        return result.map(function(c) {
          return parseInt(c, 16);
        }).join(',');
      };
      return {
        hex: function() {
          return COLORS[name];
        },
        rgb: function() {
          return `rgb(${getRgba(name)})`;
        },
        rgba: function(alpha = 0.5) {
          return `rgba(${getRgba(name)},${alpha})`;
        }
      };
    }
  }
};