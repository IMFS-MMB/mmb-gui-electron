<template>
    <div ref="host" class="container mt-2" v-if="show && !inProgress">
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

        <template v-for="row of rows">
            <b-row class="mt-5"></b-row>
            <b-row class="mt-1">
                <b-col v-for="(data, index) of row" :key="index">
                    <Chart :title="data.title" :series="data.series"></Chart>
                </b-col>
            </b-row>

        </template>
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
    },
    watch: {
      inProgress(newVal, oldVal) {
        if (oldVal && !newVal) {
          // true -> false
          setTimeout(() => scrollIntoView(this.$refs.host));
        }
      },
    },
  };
</script>

<style scoped lang="scss">

</style>
