<template>
  <div id="app" :class="{ busy: comparisonInProgress }">
    <router-view></router-view>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex';

  export default {
    name: 'mmb-electron',
    computed: {
      ...mapGetters('comparison', {
        comparisonInProgress: 'inProgress',
      }),
    },
  };
</script>

<style>
  #app.busy {
    cursor: wait;
  }
</style>
