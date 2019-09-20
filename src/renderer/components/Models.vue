<template>
    <div class="ctrl-set ctrl-set-models">
        <div class="ctrl-set-header">
            <div class="ctrl-set-title">
                Models
                <small class="ctrl-set-stats">({{selectedIndex}}/{{total}} Selected)</small>
                &nbsp;
                <a href="javascript:void(0)" class="ctrl-set-clear" @click="clearModels">Clear</a>

            </div>

            <ModelSearch/>
        </div>
        <div class="ctrl-set-body">
            <b-row>
                <ModelList name="Calibrated" :models="modelsCalibrated"/>
                <ModelList name="Estimated US" :models="modelsEstimatedUs"/>
                <ModelList name="Estimated Euro Area" :models="modelsEstimatedEuroArea"/>
                <ModelList name="Other" :models="modelsOther"/>
                <ModelList name="Adaptive Learning" :models="modelsAdaptiveLearning"/>
            </b-row>
        </div>

            <b-row class="justify-content-center ctrl-links">
                        <div class="col text-center">
                            <a href="http://www.macromodelbase.com/files/MMB_model_list_3_0.pdf" target="_blank"><i class="fa fa-question-circle"></i>
                               Documentation of Models</a>
                        </div>
            </b-row>

    </div>
</template>
<script>
  import ModelList from '@/components/ModelList.vue';
  import ModelSearch from '@/components/ModelSearch.vue';
  import { mapGetters, mapMutations } from 'vuex';

  export default {
    components: {
      ModelList,
      ModelSearch,
    },
    data() {
      return {};
    },
    computed: {
      ...mapGetters('models', [
        'total',
        'modelsCalibrated',
        'modelsEstimatedUs',
        'modelsEstimatedEuroArea',
        'modelsOther',
        'modelsAdaptiveLearning',
      ]),
      ...mapGetters('options', {
        selectedIndex: 'numModels',
      }),
    },
    methods: {
      ...mapMutations('options', ['clearModels']),
    },
  };
</script>
