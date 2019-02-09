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

                            <SaveData class="float-right" :data="data"/>
                        </div>
                    </div>
                </div>
            </b-col>
        </b-row>

        <ChartRow v-if="acCharts && acCharts.length" :charts="acCharts"/>
        <ChartRow v-if="monCharts && monCharts.length" :charts="monCharts"/>
        <ChartRow v-if="fisCharts && fisCharts.length" :charts="fisCharts"/>

        <Variances v-if="varTable && varTable.length" :varTable="varTable"/>
    </div>
</template>

<script>
  import Chart from '@/components/Chart.vue';

  import { mapGetters } from 'vuex';
  import scrollIntoView from '@/utils/scrollIntoView';
  import SaveData from './SaveData';
  import Variances from './Variances';
  import ChartRow from './ChartRow';

  export default {
    components: {
      ChartRow,
      Variances,
      SaveData,
      Chart,
    },
    data() {
      return {
        loading: true,
        comparison: undefined,
      };
    },
    computed: {
      ...mapGetters('comparison', ['varTable', 'acCharts', 'monCharts', 'fisCharts', 'inProgress', 'show', 'data']),
      ...mapGetters('settings', ['numModels', 'numPolicyRules', 'numShocks', 'numOutputVars']),
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

