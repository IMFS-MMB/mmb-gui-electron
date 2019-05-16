<template>
    <b-modal id="settingsModal" size="lg" centered ok-only>
        <h5 slot="modal-header" class="modal-title">Settings</h5>
        <button slot="modal-header" class="close" @click="hideModal"><span
                aria-hidden="true">&times;</span>
        </button>

        <BackendSelection/>
        <DynareSelection class="mt-3"/>
    </b-modal>
</template>
<script>
  import DynareSelection from './DynareSelection';
  import BackendSelection from './BackendSelection';

  export default {
    components: { BackendSelection, DynareSelection },
    methods: {
      hideModal() {
        this.$root.$emit('bv::hide::modal', 'settingsModal');
      },
    },
  };
</script>
