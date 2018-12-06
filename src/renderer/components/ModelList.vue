<template>
    <b-col>
        <div class="category-title">
            <span>{{name}}</span>
        </div>

        <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="selection">
            <template v-for="model in models">
                <div :id="'cb-wrapper-' + id + model.id">
                    <b-form-checkbox :value="model">{{model.internal_name}}</b-form-checkbox>
                </div>

                <ModelPopover :id="id" :model="model"/>
            </template>
        </b-form-checkbox-group>
    </b-col>
</template>

<script>
  import { mapMutations, mapGetters, mapActions } from 'vuex'; // eslint-disable-line no-unused-vars
  import ModelPopover from './ModelPopover';

  let nextId = 0;

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
          this.setModelSelection(value);
        },
      },
    },
    methods: {
      ...mapMutations('selections', { setModelSelection: 'setModels' }),
    },
    data() {
      return {
        id: `list-${nextId++}-`, // eslint-disable-line
      };
    },
  };
</script>

