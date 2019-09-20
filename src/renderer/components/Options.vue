<template>
    <div class="ctrl-set ctrl-set-output">
        <div class="ctrl-set-header">
            <div class="ctrl-set-title">
                Options
            </div>
        </div>

        <div class="ctrl-set-body">
            <div class="ctrl-set-listing">
                <b-form-checkbox v-model="plotAutocorrelationModel">Plot autocorrelation functions</b-form-checkbox>
                <b-form-checkbox v-model="plotVarianceModel" :disabled="!isPlotVarianceAvailable">Plot variances</b-form-checkbox>
                <Horizon class="mt-2" v-if="$isElectron"/>
                <Gain class="mt-1" v-if="$isElectron"/>
                <button class="btn btn-primary btn-sm" v-if="$isElectron" :disabled="!alModelSelected" v-b-modal.modelStatesModal>Select states</button>
            </div>
        </div>

        <template v-if="$isElectron">
            <ModelStatesModal/>
        </template>
    </div>
</template>
<script>
  // eslint-disable-next-line no-unused-vars
  import { mapMutations, mapGetters, mapActions } from 'vuex';
  import Horizon from '@/components/Horizon';
  import Gain from '@/components/Gain';
  import ModelStatesModal from '@/modals/ModelStatesModal';
  import { isElectron } from '../../constants';

  const platformComponents = isElectron ? {
    ModelStatesModal,
  } : {};

  export default {
    components: {
      Gain,
      Horizon,
      ...platformComponents,
    },
    computed: {
      ...mapGetters('options', [
        'alModelSelected',
        'plotAutocorrelation',
        'plotVariance',
        'isPlotVarianceAvailable',
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
      ...mapMutations('options', [
        'setPlotAutocorrelation',
        'setPlotVariance',
      ]),
    },
  };
</script>
<style lang="scss" scoped>
    button.btn {
        width: calc(100% - 10px);
        margin: 5px;
    }
</style>
