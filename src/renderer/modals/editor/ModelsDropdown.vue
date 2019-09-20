<template>
    <b-dropdown class="models-dropdown" variant="outline-dark" text="edit" boundary="viewport">
        <b-dropdown-header>Models Calibrated</b-dropdown-header>
        <b-dropdown-item v-for="model of modelsCalibrated" :key="model.name">{{model.name}}</b-dropdown-item>
        <b-dropdown-header>Models Estimated US</b-dropdown-header>
        <b-dropdown-item v-for="model of modelsEstimatedUs" :key="model.name">{{model.name}}</b-dropdown-item>
        <b-dropdown-header>Models Estimated Euro Area</b-dropdown-header>
        <b-dropdown-item v-for="model of modelsEstimatedEuroArea" :key="model.name">{{model.name}}</b-dropdown-item>
        <b-dropdown-header>Models Other</b-dropdown-header>
        <b-dropdown-item v-for="model of modelsOther" :key="model.name">{{model.name}}</b-dropdown-item>
        <b-dropdown-header>Models Adaptive Learning</b-dropdown-header>
        <b-dropdown-item v-for="model of modelsAdaptiveLearning" :key="model.name">{{model.name}}</b-dropdown-item>
    </b-dropdown>
</template>
<script>
  import { mapGetters } from 'vuex'; // eslint-disable-line no-unused-vars

  export default {
    components: {

    },
    data() {
      return {};
    },
    computed: {
      ...mapGetters('models', [
        'modelsCalibrated',
        'modelsEstimatedUs',
        'modelsEstimatedEuroArea',
        'modelsOther',
        'modelsAdaptiveLearning',
      ]),
    },
    methods: {

    },
  };
</script>
<style lang="scss">
    .models-dropdown > .dropdown-menu{
        max-height: 60vh;
        overflow:auto;
    }
</style>
