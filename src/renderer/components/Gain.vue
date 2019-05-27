<template>
    <div class="gain" :class="classes">
        <div class="text">Gain: {{model}}</div>
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
          min: 0,
          max: 0.05,
          interval: 0.001,
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
      ...mapGetters('settings', ['gain', 'models']),
      classes() {
        return {
          show: this.models.some(m => !!m.al),
        };
      },
      model: {
        get() {
          return this.gain;
        },
        set(value) {
          this.setGain(value);
        },
      },
    },
    methods: {
      ...mapMutations('settings', ['setGain']),
    },
  };
</script>

<style scoped lang="scss">
    .gain {
        opacity: 0;
        transition: opacity .1s ease-in-out;

        &.show {
            opacity: 1;
        }
    }

    .text {
        font-size: 0.9rem;
        padding-left: 30px;
    }

    .slider {
        margin-left: 22px;
        margin-right: 22px;
    }
</style>
