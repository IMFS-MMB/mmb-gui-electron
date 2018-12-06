<template>
    <div class="ctrl-set ctrl-set-prules">
        <div class="ctrl-set-header">
            <div class="ctrl-set-title">
                Policy Rules
                <small class="ctrl-set-stats">({{selectedIndex}}/{{rules.length}} Selected)</small>
                <a href="javascript:void(0)" class="ctrl-set-clear" @click="clear">&nbsp;Clear</a>
            </div>
        </div>

        <div class="ctrl-set-body">
            <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="selection">
                <b-form-checkbox class="cb-user-rule" :key="1" :value="{ id: 1 }" :disabled="isRuleDisabled(1)">
                    User specified rule
                    <a href="javascript:void(0)" v-b-modal.userSpecifiedRuleModal>(edit)</a>
                </b-form-checkbox>
                <b-form-checkbox :key="2" :value="{ id: 2 }"  :disabled="isRuleDisabled(2)">Model specific rule</b-form-checkbox>

                <b-form-checkbox v-for="rule in rules"
                                 :key="rule.id"
                                 :value="rule"
                                 :disabled="isRuleDisabled(rule.id)">
                    {{ rule.description.ac_ref }}
                </b-form-checkbox>
            </b-form-checkbox-group>
        </div>
    </div>
</template>
<script>
  import { mapMutations, mapGetters } from 'vuex'; // eslint-disable-line no-unused-vars

  export default {
    computed: {
      ...mapGetters('rules', ['rules']),
      ...mapGetters('selections', {
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
      ...mapMutations('selections', {
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