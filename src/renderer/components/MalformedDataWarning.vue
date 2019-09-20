<template>
    <div></div>
</template>
<script>
  import { mapGetters } from 'vuex';

  export default {
    computed: {
      ...mapGetters('models', ['modelErrors']),
      ...mapGetters('rules', ['ruleErrors']),
    },
    watch: {
      modelErrors(errors) {
        errors.forEach((err) => {
          this.$bvToast.toast(`There was an error loading model ${err.model}:\n${err.message}`, {
            title: 'Model Error',
            variant: 'danger',
            noAutoHide: true,
          });
        });
      },
      ruleErrors(errors) {
        errors.forEach((err) => {
          this.$bvToast.toast(`There was an error loading rule ${err.rule}:\n${err.message}`, {
            message: 'Rule Error',
            variant: 'danger',
            noAutoHide: true,
          });
        });
      },
    },
  };
</script>
