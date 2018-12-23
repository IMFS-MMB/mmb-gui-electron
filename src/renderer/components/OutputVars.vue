<template>
    <div class="ctrl-set ctrl-set-output">
        <div class="ctrl-set-header">
            <div class="ctrl-set-title">
                Output Options
                <small class="ctrl-set-stats">({{selectedIndex}}/{{total}} Selected)</small>
                <a href="javascript:void(0)" class="ctrl-set-clear" @click="clear">&nbsp;Clear</a>
            </div>
        </div>

        <div class="ctrl-set-body">
            <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="selection">
                <b-form-checkbox v-for="outputVar in outputVars"
                                 :key="outputVar.id"
                                 :value="outputVar">
                    {{outputVar.text}}
                </b-form-checkbox>
            </b-form-checkbox-group>
        </div>
    </div>
</template>
<script>
  import { mapMutations, mapGetters, mapActions } from 'vuex'; // eslint-disable-line no-unused-vars
  import outputVars from '@/data/output_vars';

  export default {
    data() {
      return {
        outputVars,
      };
    },
    computed: {
      ...mapGetters('selections', {
        selectedIndex: 'numOutputVars',
        outputVarSelection: 'outputVars',
      }),
      selection: {
        get() {
          return this.outputVarSelection;
        },
        set(value) {
          this.setOutputVars(value);
        },
      },

      total() {
        return this.outputVars.length;
      },
    },
    methods: {
      ...mapMutations('selections', {
        clear: 'clearOutputVars',
        setOutputVars: 'setOutputVars',
      }),
    },
  };
</script>
