<template>
    <b-modal id="modelStatesModal" size="lg" centered ok-only>
        <h5 slot="modal-header" class="modal-title">Select States</h5>

        <b-tabs content-class="mt-3" :lazy="true">
            <b-tab v-for="(model, index) in alModels" :active="index === 0" :key="model.name" :title="model.name">
                <ModelStates :model="model"/>
            </b-tab>
        </b-tabs>
    </b-modal>
</template>
<script>
  import { mapGetters } from 'vuex';
  import ModelStates from './ModelStates';

  export default {
    components: { ModelStates },
    computed: {
      ...mapGetters('options', ['alModels']),
    },
    methods: {
      hideModal() {
        this.$root.$emit('bv::hide::modal', 'modelStatesModal');
      },
    },
  };
</script>
