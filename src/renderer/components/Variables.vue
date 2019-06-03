<template>
    <div class="ctrl-set ctrl-set-variables">
        <div class="ctrl-set-header">
            <div class="ctrl-set-title">
                Variables
                <small class="ctrl-set-stats">({{numSelected}}/{{total}} Selected)</small>
                <a href="javascript:void(0)" class="ctrl-set-clear" @click="selectAll">Select all</a>
                <a href="javascript:void(0)" class="ctrl-set-clear" @click="clear">&nbsp;Clear</a>
            </div>
        </div>

        <div class="ctrl-set-body">
            <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="selection">
                <b-form-checkbox v-for="variable in variables"
                                 :key="variable.name"
                                 :value="variable">
                    {{variable.text}}
                </b-form-checkbox>
            </b-form-checkbox-group>
        </div>
    </div>
</template>
<script>
  import { mapMutations, mapGetters, mapActions } from 'vuex'; // eslint-disable-line no-unused-vars
  import commonVariables from '@/data/variables';

  export default {
    computed: {
      ...mapGetters('settings', {
        numSelected: 'numVariables',
        variableSelection: 'variables',
        modelSelection: 'models',
      }),
      variables() {
        if (this.modelSelection.length !== 1) {
          return commonVariables;
        }

        return [
          ...commonVariables,
          ...this.modelSelection[0].variables.filter(v =>
            !commonVariables.some(cv => cv.name === v.name)),
        ];
      },
      selection: {
        get() {
          return this.variableSelection;
        },
        set(value) {
          this.setVariables(value);
        },
      },

      total() {
        return this.variables.length;
      },
    },
    methods: {
      ...mapMutations('settings', {
        clear: 'clearVariables',
        setVariables: 'setVariables',
      }),
      selectAll() {
        this.setVariables(this.variables);
      },
    },
  };
</script>
