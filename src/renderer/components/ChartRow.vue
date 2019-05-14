<template>
    <b-row class="mt-5" v-if="hasAtLeastOneSeries(charts)">
        <b-col v-for="(chart, index) of charts" :key="index">
            <Chart v-if="chart.series.length" :title="chart.title" :series="chart.series"></Chart>
        </b-col>
    </b-row>
</template>
<script>
  import Chart from '@/components/Chart.vue';

  export default {
    name: 'ChartRow',
    components: { Chart },
    props: {
      charts: {
        default: () => [],
      },
    },
    methods: {
      hasAtLeastOneSeries(charts) {
        return charts && charts.some(chart => !!chart.series.length);
      },
    },
  };
</script>
