<template>
    <b-row>
        <b-col>
            <b-alert class="m-0" variant="warning" :show="showWarning">
                <b>Warning:</b> Some of the chosen variables <span v-if="missingVariablesText">({{missingVariablesText}})</span>
                or shocks <span v-if="missingShocksText">({{missingShocksText}})</span> are not available for all selected models.
                Simulations will run but some data series will be missing.
            </b-alert>
        </b-col>
    </b-row>
</template>
<script>
  import { mapGetters } from 'vuex';

  export default {
    computed: {
      ...mapGetters('options', [
        'models',
        'variables',
        'shocks',
      ]),
      missingVariables() {
        return this.variables
          .filter(variable =>
            this.models.some(model =>
              !model.variables.find(mVariable => mVariable.text === variable.text)))
          .map(variable => variable.text);
      },
      missingShocks() {
        return this.shocks
          .filter(shock =>
            this.models.some(model =>
              !model.shocks.find(mShock => mShock.text === shock.text)))
          .map(shock => shock.text);
      },
      missingShocksText() {
        return this.missingShocks.join(', ');
      },
      missingVariablesText() {
        return this.missingVariables.join(', ');
      },
      showWarning() {
        return !!(this.missingShocks.length || this.missingVariables.length);
      },
    },
  };
</script>
