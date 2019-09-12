<template>
    <div :id="id"></div>
</template>

<script>
  import * as HighCharts from 'highcharts';
  import { mapGetters } from 'vuex';

  const legendId = 'chart-legend';

  export default {
    computed: {
      ...mapGetters('comparison', ['legendSeries']),
    },
    data() {
      return {
        id: legendId,
        chart: undefined,
      };
    },
    mounted() {
      this.chart = new HighCharts.Chart({
        chart: {
          renderTo: this.id,
          height: 100,
        },
        title: {
          text: null,
        },
        yAxis: {
          visible: false,
        },
        xAxis: {
          visible: false,
        },
        legend: {
          padding: 0,
          margin: 0,
          verticalAlign: 'middle',
          maxHeight: 100,
        },
        exporting: {
          enabled: false,
        },
        series: this.legendSeries,
        plotOptions: {
          series: {
            events: {
              legendItemClick: (event) => {
                const legendSeries = event.target;
                HighCharts.charts.forEach((chart) => {
                  if (!chart || chart === legendSeries.chart) {
                    return;
                  }

                  const otherSeries = chart.get(legendSeries.options.id);

                  if (otherSeries) {
                    if (legendSeries.visible) {
                      otherSeries.hide();
                    } else {
                      otherSeries.show();
                    }
                  }
                });
              },
            },
          },
        },
      });
    },

    beforeDestroy() {
      try {
        this.chart.destroy();
      } catch (e) { /* noop */ }
    },
  };
</script>

<style scoped lang="scss">

</style>
