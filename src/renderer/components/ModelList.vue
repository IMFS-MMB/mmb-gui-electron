<template>
    <b-col>
        <div class="category-title">
            <span>{{name}}</span>
        </div>

        <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="selection">
            <template v-for="model in models">
                <div :id="'cb-wrapper-' + model.id">
                    <b-form-checkbox :value="model">{{model.internal_name}}</b-form-checkbox>
                </div>

                <ModelPopover :model="model"/>
            </template>
        </b-form-checkbox-group>
    </b-col>
</template>

<script>
  import { mapMutations, mapGetters, mapActions } from 'vuex'; // eslint-disable-line no-unused-vars
  import deepEqual from 'fast-deep-equal';
  import ModelPopover from './ModelPopover.vue';

  export default {
    components: {
      ModelPopover,
    },
    props: {
      name: {},
      models: {
        default: () => [],
      },
    },
    computed: {
      ...mapGetters('selections', { modelSelection: 'models' }),
      selection: {
        get() {
          return this.modelSelection;
        },
        set(value) {
          // all 5 model lists share the same model, so this is somehow triggered 5 times on change
          // serializing state is expensive, so only set vuex state if necessary
          if (!deepEqual(this.selection, value)) {
            this.setModelSelection(value);
          }
        },
      },
    },
    methods: {
      ...mapMutations('selections', { setModelSelection: 'setModels' }),
    },
  };
</script>

