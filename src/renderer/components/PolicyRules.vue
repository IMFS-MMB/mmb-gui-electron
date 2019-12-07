<template>
    <div class="ctrl-set ctrl-set-prules">
        <div class="ctrl-set-header">
            <span class="ctrl-set-title">Policy Rules</span>
            <small class="ctrl-set-stats">({{selectedIndex}}/{{rules.length}})</small>
            <a href="javascript:void(0)" class="ctrl-set-clear" @click="clear">&nbsp;Clear</a>
        </div>

        <div class="ctrl-set-body">
            <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="selection">
                <template v-if="rules.length">
                    <b-form-checkbox v-if="$isElectron" class="cb-user-rule" :key="'cb-rule-' + USER_RULE" :value="{ name: USER_RULE }" :disabled="isRuleDisabled(USER_RULE)">
                        User specified rule
                        <a href="javascript:void(0)" v-b-modal.userSpecifiedRuleModal>(edit)</a>
                    </b-form-checkbox>
                    <b-form-checkbox :key="'cb-rule-' + MODEL_RULE" :value="{ name: MODEL_RULE }" :disabled="isRuleDisabled(MODEL_RULE)">
                        <span class="rule-caption">Model specific rule</span>
                    </b-form-checkbox>
                    <template v-for="(rule, index) in rules">
                        <div :id="'cb-rule-' + rule.name" :key="'cb-rule-' + rule.name">
                            <b-form-checkbox ref="cb" :value="rule" :disabled="isRuleDisabled(rule.name)">
                                {{ rule && rule.description && rule.description.ac_ref }}
                            </b-form-checkbox>
                        </div>
                        <RulePopover :rule="rule" :key="'popover-rule-' + rule.name"/>
                    </template>
                </template>
                <div class="spinner-box" v-if="!rules.length">
                    <b-spinner variant="primary" type="grow" label="Spinning"></b-spinner>
                </div>
            </b-form-checkbox-group>
        </div>

            <b-row class="mt-3 justify-content-center ctrl-links">
                        <div class="col text-center">
                            <a href="http://www.macromodelbase.com/files/MMB_MPrule_description.pdf" target="_blank"><i class="fa fa-question-circle"></i>
                               Documentation of Policy Rules</a>
                        </div>
            </b-row>
    </div>
</template>
<script>
  import { mapMutations, mapGetters } from 'vuex';
  import RulePopover from './RulePopover';
  import { MODEL_RULE, USER_RULE } from '../../config/constants';

  export default {
    components: {
      RulePopover,
    },
    data() {
      return {
        USER_RULE,
        MODEL_RULE,
      };
    },
    computed: {
      ...mapGetters('rules', ['rules']),
      ...mapGetters('options', {
        isRuleDisabled: 'isRuleDisabled',
        selectedIndex: 'numPolicyRules',
        policyRuleSelection: 'policyRules',
      }),
      selection: {
        get() {
          return this.policyRuleSelection;
        },
        set(value) {
          this.setPolicyRules(value);
        },
      },
    },
    methods: {
      ...mapMutations('options', {
        clear: 'clearPolicyRules',
        setPolicyRules: 'setPolicyRules',
      }),
    },
  };
</script>
<style lang="scss">
    .cb-user-rule > label {
        display: flex !important;
        justify-content: space-between;
    }
</style>

