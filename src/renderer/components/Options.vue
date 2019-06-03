<template>
    <div class="ctrl-set ctrl-set-output">
        <div class="ctrl-set-header">
            <div class="ctrl-set-title">
                Options
            </div>
        </div>

        <div class="ctrl-set-body">
            <div class="ctrl-set-listing">
                <b-form-checkbox :model="plotAutocorrelationModel">Plot autocorrelation functions</b-form-checkbox>
                <b-form-checkbox :model="plotVarianceModel">Plot variances</b-form-checkbox>

                <Horizon class="mt-2" v-if="$isElectron"/>
                <Gain class="mt-1" v-if="$isElectron"/>
            </div>
        </div>
    </div>
</template>
<script>
  // eslint-disable-next-line no-unused-vars
  import { mapMutations, mapGetters, mapActions } from 'vuex';
  import Horizon from '@/components/Horizon';
  import Gain from '@/components/Gain';

  export default {
    components: {
      Gain,
      Horizon,
    },
    computed: {
      ...mapGetters('settings', [
        'plotAutocorrelation',
        'plotVariance',
      ]),
      plotAutocorrelationModel: {
        get() {
          return this.plotAutocorrelation;
        },
        set(value) {
          this.setPlotAutocorrelation(value);
        },
      },
      plotVarianceModel: {
        get() {
          return this.plotVariance;
        },
        set(value) {
          this.setPlotVariance(value);
        },
      },

      total() {
        return this.outputVars.length;
      },
    },
    methods: {
      ...mapMutations('settings', [
        'setPlotAutocorrelation',
        'setPlotVariance',
      ]),
    },
  };
</script>
