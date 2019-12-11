<template>
    <b-row>
        <b-col>
            <b-alert class="m-0" variant="warning" :show="showWarning">
                <b>Warning:</b> the sample size for calculating AC functions and variances is small due to speed considerations. Estimates will be of inferior precision.
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
