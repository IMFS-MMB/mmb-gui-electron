<template>
    <b-col class="model-list"
           cols="12"
           sm="6"
           md="4"
           lg="4"
           xl>
        <div class="category-title">
            <span>{{name}}</span>
        </div>

        <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="selection">
            <div class="spinner-box" v-if="!models.length && !isSearching">
                <b-spinner variant="primary" type="grow" label="Spinning"></b-spinner>
            </div>
            <template v-for="model in models">
                <div :id="'cb-wrapper-' + model.name" :key="'cb-model-' + model.name">
                    <b-form-checkbox :value="model" :disabled="isModelDisabled(model)">{{model.name}}</b-form-checkbox>
                </div>

                <ModelPopover :model="model" :key="'popover-model-' + model.name"/>
            </template>
        </b-form-checkbox-group>
    </b-col>
</template>

<script>
  import { mapMutations, mapGetters } from 'vuex';
  import memoize from 'memoize-one';
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
      ...mapGetters('options', {
        modelSelection: 'models',
        isModelDisabled: 'isModelDisabled',
      }),
      ...mapGetters('search', ['text']),
      isSearching() {
        return !!this.text;
      },
      selection: {
        get() {
          return this.modelSelection;
        },
        // all 5 model lists share the same model, so this is somehow triggered 5 times on change
        // serializing state is expensive, so only set vuex state if necessary

        // eslint-disable-next-line func-names
        set: memoize(function (value) {
          this.setModelSelection(value);
        }),
      },
    },
    methods: {
      ...mapMutations('options', { setModelSelection: 'setModels' }),
    },
  };
</script>

<style lang="scss">
    @import "~bootstrap/scss/functions";
    @import "~bootstrap/scss/variables";
    @import "~bootstrap/scss/mixins/_breakpoints";

    @include media-breakpoint-only(sm) {
        .model-list {
            &:nth-last-child(1) {
                max-width: unset;
                flex-grow: 1;
            }
        }
    }

    @include media-breakpoint-between(md, lg) {
        .model-list {
            &:nth-last-child(1), &:nth-last-child(2) {
                max-width: unset;
                flex-grow: 1;
            }
        }
    }

</style>
