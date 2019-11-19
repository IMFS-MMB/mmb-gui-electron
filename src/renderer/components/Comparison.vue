<template>
    <b-container id="comparison" fluid class="mt-2" v-if="show && !inProgress">
        <b-row class="mt-2">
            <b-col>
                <div class="comparison-set">
                    <div class="row comparison-set-header">
                        <b-col cols="12" sm="6" class="comparison-set-title">
                            <span>Comparison</span>
                            <small class="d-none d-md-inline-block">({{numModels}} Model{{ numModels === 1 ? '' : 's'
                                }},
                                {{numPolicyRules}} Policy Rule{{ numPolicyRules === 1 ? '' : 's' }},
                                {{numShocks}} Shock{{ numShocks === 1 ? '' : 's' }})
                            </small>
                        </b-col>
                        <b-col cols="12" sm="6"
                               class="d-flex align-items-center justify-content-between justify-content-sm-end">
                            <SaveData :nested="data" :normalized="normalizedData"/>
                            <DataOrder class="order-sm-first mr-3" style="margin-top: 0 !important;"/>
                            <ColsPerRow class="order-sm-first mr-3"></ColsPerRow>
                        </b-col>
                    </div>
                </div>
            </b-col>
        </b-row>

        <b-row>
            <b-col>
                <ChartLegend></ChartLegend>
            </b-col>
        </b-row>

        <template v-for="(section, index1) in sections">
            <h4 class="text-center">{{section.title}}</h4>
            <ChartRow :class="{'mt-5': index2 > 0 }" v-for="(chartrow, index2) in section.rows" :key="`${index1}-${index2}`" :charts="chartrow"/>
        </template>

        <Variances v-if="varTable && varTable.length" :varTable="varTable"/>
    </b-container>
</template>

<script>
  import { mapGetters } from 'vuex';
  import SaveData from './SaveData';
  import Variances from './Variances';
  import ChartRow from './ChartRow';
  import ChartLegend from './ChartLegend';
  import ColsPerRow from './ColsPerRow';
  import DataOrder from './DataOrder';

  export default {
    components: {
      DataOrder,
      ColsPerRow,
      ChartRow,
      Variances,
      SaveData,
      ChartLegend,
    },
    data() {
      return {
        loading: true,
        comparison: undefined,
      };
    },
    computed: {
      ...mapGetters('comparison', [
        'varTable',
        'inProgress',
        'show',
        'data',
        'normalizedData',
        'sections',
        'colsPerRow',
      ]),
      ...mapGetters('options', ['numModels', 'numPolicyRules', 'numShocks']),
    },
  };
</script>
