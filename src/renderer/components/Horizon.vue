<template>
    <div>
        <div class="text">Horizon: {{model}}</div>
        <vue-slider class="slider" v-model="model" v-bind="options"></vue-slider>
    </div>
</template>

<script>
  import vueSlider from 'vue-slider-component';
  import { mapGetters, mapMutations } from 'vuex';

  export default {
    components: {
      vueSlider,
    },
    data() {
      return {
        options: {
          data: null,
          eventType: 'drag-end',
          width: 'auto',
          height: 6,
          dotSize: 16,
          dotHeight: null,
          dotWidth: null,
          min: 1,
          max: 100,
          interval: 1,
          show: true,
          speed: 0.5,
          disabled: false,
          piecewise: false,
          usdKeyboard: false,
          enableCross: true,
          piecewiseLabel: false,
          tooltip: 'hover',
          tooltipDir: 'top',
          reverse: false,
          clickable: true,
          realTime: false,
          lazy: true,
          formatter: null,
          bgStyle: null,
          sliderStyle: null,
          processStyle: null,
          piecewiseActiveStyle: null,
          tooltipStyle: null,
          labelStyle: null,
          labelActiveStyle: null,
        },
      };
    },
    computed: {
      ...mapGetters('settings', ['horizon']),
      model: {
        get() {
          return this.horizon;
        },
        set(value) {
          this.setHorizon(value);
        },
      },
    },
    methods: {
      ...mapMutations('settings', ['setHorizon']),
    },
  };
</script>

<style scoped lang="scss">
    .text {
        font-size: 0.9rem;
        padding-left: 8px;
    }
</style>
