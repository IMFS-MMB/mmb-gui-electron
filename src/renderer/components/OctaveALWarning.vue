<template>
    <b-row>
        <b-col>
            <b-alert class="m-0" variant="warning" :show="showWarning">
                AL model warning here.
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
      ...mapGetters('options', ['models']),
      isOctave() {
        return !!this.selectedBackend && this.selectedBackend.type === InterfaceType.Octave;
      },
      isALModel() {
        return this.models.some(model => !!model.al);
      },
      showWarning() {
        return this.isOctave && this.isALModel;
      },
    },
  };
</script>
