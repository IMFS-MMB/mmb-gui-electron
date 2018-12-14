<template>
    <div ref="host" class="container mt-2" v-if="show && !inProgress" v-infinite-scroll="showMore" infinite-scroll-distance="10">
        <b-row class="mt-2">
            <b-col>
                <div class="comparison-set">
                    <div class="comparison-set-header">
                        <div class="comparison-set-title">
                            Comparison
                            <small class="comparison-set-stats">(
                                {{numModels}} Models,
                                {{numPolicyRules}} Policy Rules,
                                {{numShocks}} Shock,
                                {{numOutputVars}} Variable Outputs
                                )
                            </small>
                        </div>
                    </div>
                </div>
            </b-col>
        </b-row>

        <!--<template v-for="section in sections">-->


        <!--</template>-->
        <template v-for="row of visibleRows">
            <b-row class="mt-5"></b-row>
            <b-row class="mt-1">
                <b-col v-for="(data, index) of row" :key="index">
                    <Chart :title="data.title" :series="data.series"></Chart>
                </b-col>
            </b-row>

        </template>
        <hr class="mt-4">

        <b-row class="mt-5">
            <b-col class="col text-center">
                <p>Showing <strong>{{visibleCount}}</strong> of <strong>{{totalCount}}</strong> charts</p>
                <a href="javascript:void(0)" v-if="visibleCount < totalCount" @click="showMore">
                    <i class="fa fa-plus"></i> Show more
                </a>
            </b-col>
        </b-row>
    </div>
</template>

<script>
  import Chart from '@/components/Chart.vue';

  import { mapGetters } from 'vuex';
  import scrollIntoView from '@/utils/scrollIntoView';

  const CHARTS_PER_ROW = 2;

  export default {
    components: {
      Chart,
    },
    data() {
      return {
        visible: 2,
        loading: true,
        comparison: undefined,
      };
    },
    computed: {
      ...mapGetters('comparison', ['chartData', 'inProgress', 'show']),
      ...mapGetters('selections', ['numModels', 'numPolicyRules', 'numShocks', 'numOutputVars']),
      rows() {
        const data = this.chartData;

        const result = [];

        for (let i = 0; i < data.length; i += CHARTS_PER_ROW) {
          result.push(data.slice(i, i + CHARTS_PER_ROW));
        }

        return result;
      },
      visibleRows() {
        return this.rows.slice(0, this.visible);
      },
      visibleCount() {
        return Math.min(this.visibleRows.length * CHARTS_PER_ROW, this.chartData.length);
      },
      totalCount() {
        return this.chartData.length;
      },
    },
    watch: {
      inProgress(newVal, oldVal) {
        if (oldVal && !newVal) {
          // true -> false
          setTimeout(() => scrollIntoView(this.$refs.host));
        }
      },
    },
    methods: {
      showMore() {
        this.visible += 2;
      },
    },
  };
</script>

<style scoped lang="scss">

</style>
