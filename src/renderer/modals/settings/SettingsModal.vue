<template>
    <b-modal id="settingsModal" size="lg" centered ok-only>
        <h5 slot="modal-header" class="modal-title">Settings</h5>
        <button slot="modal-header" class="close" @click="hideModal"><span
                aria-hidden="true">&times;</span>
        </button>

        <BackendSelection/>
        <DynareSelection class="mt-3"/>
        <MmbPathSelection class="mt-3"></MmbPathSelection>

        <CompatibilityTest slot="modal-footer" style="margin-right: auto;"/>
        <b-btn slot="modal-footer" @click="hideModal">Close</b-btn>
    </b-modal>
</template>
<script>
  import DynareSelection from './DynareSelection';
  import BackendSelection from './BackendSelection';
  import MmbPathSelection from './MmbPathSelection';
  import CompatibilityTest from './CompatibilityTest/CompatibilityTest';

  export default {
    components: {
      CompatibilityTest,
      BackendSelection,
      DynareSelection,
      MmbPathSelection,
    },
    methods: {
      hideModal() {
        this.$root.$emit('bv::hide::modal', 'settingsModal');
      },
    },
  };
</script>
