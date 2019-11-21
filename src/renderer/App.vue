<template>
  <div id="app" :class="{ busy: comparisonInProgress }">
    <HomePage></HomePage>
  </div>
</template>

<script>
  import { mapActions, mapGetters } from 'vuex';
  import HomePage from './components/HomePage';

  export default {
    name: 'mmb-electron',
    components: { HomePage },
    computed: {
      ...mapGetters('comparison', {
        comparisonInProgress: 'inProgress',
      }),
    },
    methods: {
      ...mapActions('ui', ['userHasTouched', 'userHasMovedMouse']),
    },
    created() {
      // https://codeburst.io/the-only-way-to-detect-touch-with-javascript-7791a3346685

      const onFirstHover = () => {
        this.userHasMovedMouse();
        window.removeEventListener('mouseover', onFirstHover, false);
      };

      const onFirstTouch = () => {
        this.userHasTouched();
        window.removeEventListener('touchstart', onFirstTouch, false);
      };

      window.addEventListener('touchstart', onFirstTouch, false);
      window.addEventListener('mouseover', onFirstHover, false);
    },
  };
</script>

<style>
  #app.busy {
    cursor: wait;
  }
</style>
