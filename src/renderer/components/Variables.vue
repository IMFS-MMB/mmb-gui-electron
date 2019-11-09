<template>
    <div class="ctrl-set ctrl-set-variables">
        <div class="ctrl-set-header">
            <span class="ctrl-set-title">Variables</span>
            <small class="ctrl-set-stats">({{numSelected}}/{{total}})</small>
            <a href="javascript:void(0)" class="ctrl-set-clear" @click="selectAll">Select all</a>
            <a href="javascript:void(0)" class="ctrl-set-clear" @click="clear">&nbsp;Clear</a>
        </div>

        <div class="ctrl-set-body">
            <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="selection">
                <b-form-checkbox v-for="variable in variables"
                                 :key="variable.name"
                                 :value="variable">
                    {{variable.text}}
                </b-form-checkbox>
                <template v-if="modelSpecificVariablesUnavailable">
                    <div id="model-specific-variables-unavailable">
                        <b-form-checkbox :value="null" :disabled="true">
                            Model Specific Variables
                        </b-form-checkbox>
                    </div>
                    <b-popover target="model-specific-variables-unavailable"
                               :delay="{ show: 250, hide: 0 }"
                               placement="left"
                               triggers="hover"
                               boundary="viewport">
                        <div>
                            <p>Model specific variables are unavailable with your current options.</p>
                            <p class="mb-0">Select <em>exactly one</em> model to make its specific variables available.</p>
                        </div>
                    </b-popover>
                </template>
            </b-form-checkbox-group>
        </div>
    </div>
</template>
<script>
  import { mapMutations, mapGetters } from 'vuex';

  export default {
    computed: {
      ...mapGetters('options', ['modelSpecificVariablesUnavailable']),
      ...mapGetters('options', {
        numSelected: 'numVariables',
        variableSelection: 'variables',
        variables: 'variablesAvailable',
      }),
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
      ...mapMutations('options', {
        clear: 'clearVariables',
        setVariables: 'setVariables',
      }),
      selectAll() {
        this.setVariables(this.variables);
      },
    },
  };
</script>
