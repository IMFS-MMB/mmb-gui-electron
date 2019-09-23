<template>
    <b-container fluid ref="host" class="mt-2" v-if="show && !inProgress">
        <b-row class="mt-2">
            <b-col>
                <div class="comparison-set">
                    <div class="row comparison-set-header">
                        <b-col cols="12" sm="6" class="comparison-set-title">
                                <span>Comparison</span>
                                <small class="d-none d-md-inline-block">({{numModels}} Model{{ numModels === 1 ? '' : 's' }},
                                    {{numPolicyRules}} Policy Rule{{ numPolicyRules === 1 ? '' : 's' }},
                                    {{numShocks}} Shock{{ numShocks === 1 ? '' : 's' }})
                                </small>
                        </b-col>
                        <b-col cols="12" sm="6" class="d-flex align-items-center justify-content-between justify-content-sm-end">
                            <SaveData :data="data"/>
                            <ColsPerRow class="order-sm-first mr-3"></ColsPerRow>
                        </b-col>
                    </div>
                </div>
            </b-col>
        </b-row>

        <b-row><b-col><ChartLegend></ChartLegend></b-col></b-row>

        <ChartRow :class="{'mt-5': index > 0 }" v-for="(chartrow, index) in chartRows" :key="index" :charts="chartrow"/>

        <Variances v-if="varTable && varTable.length" :varTable="varTable"/>
    </b-container>
</template>

<script>
  import Chart from '@/components/Chart.vue';

  import { mapGetters } from 'vuex';
  import scrollIntoView from '@/utils/scrollIntoView';
  import SaveData from './SaveData';
  import Variances from './Variances';
  import ChartRow from './ChartRow';
  import ChartLegend from './ChartLegend';
  import ColsPerRow from './ColsPerRow';

  export default {
    components: {
      ColsPerRow,
      ChartRow,
      Variances,
      SaveData,
      Chart,
      ChartLegend,
    },
    data() {
      return {
        loading: true,
        comparison: undefined,
      };
    },
    computed: {
      ...mapGetters('comparison', ['varTable', 'inProgress', 'show', 'data', 'chartRows', 'colsPerRow']),
      ...mapGetters('options', ['numModels', 'numPolicyRules', 'numShocks']),
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
