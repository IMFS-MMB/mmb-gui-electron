<template>
    <b-row>
        <b-col>
            <b-alert class="m-0" variant="warning" :show="showWarning">
                <b>Warning:</b> calculating AC functions and/or variances will take about 10 minutes per model/policy rule combination
            </b-alert>
        </b-col>
    </b-row>
</template>
<script>
  import { mapGetters } from 'vuex';
  import { InterfaceType } from '../../common/backend/interface';

  export default {
    computed: {
      ...mapGetters('backends', {
        selectedBackend: 'selected',
      }),
      ...mapGetters('options', [
        'models',
        'plotAutocorrelation',
        'plotVariance',
      ]),
      isOctave() {
        return !!this.selectedBackend && this.selectedBackend.type === InterfaceType.Octave;
      },
      isALModel() {
        return this.models.some(model => !!model.al);
      },
      isACOrVAR() {
        return this.plotAutocorrelation || this.plotVariance;
      },
      showWarning() {
        return this.isOctave && this.isALModel && this.isACOrVAR;
      },
    },
  };
</script>
