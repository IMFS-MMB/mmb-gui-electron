<template>
    <b-row class="mt-5">
        <b-col v-for="(data, index) of charts" :key="index">
            <Chart :title="data.title" :series="data.series"></Chart>
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
  };
</script>
