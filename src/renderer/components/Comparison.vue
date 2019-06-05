<template>
    <b-container fluid ref="host" class="mt-2" v-if="show && !inProgress">
        <b-row class="mt-2">
            <b-col>
                <div class="comparison-set">
                    <div class="comparison-set-header">
                        <div class="comparison-set-title">
                            Comparison
                            <small class="comparison-set-stats">(
                                {{numModels}} Models,
                                {{numPolicyRules}} Policy Rules,
                                {{numShocks}} Shocks,
                                )
                            </small>

                            <SaveData class="float-right" :data="data"/>
                        </div>
                    </div>
                </div>
            </b-col>
        </b-row>

        <b-row><b-col><ChartLegend></ChartLegend></b-col></b-row>

        <ChartRow :class="{'mt-5': index > 0 }" v-for="(chartrow, index) in chartRows" :charts="chartrow"/>

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

  export default {
    components: {
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
      ...mapGetters('comparison', ['varTable', 'inProgress', 'show', 'data', 'chartRows']),
      ...mapGetters('settings', ['numModels', 'numPolicyRules', 'numShocks']),
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

