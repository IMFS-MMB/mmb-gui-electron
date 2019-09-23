<template>
    <ul>
        <li v-for="model of filteredModels" :key="model.name" @click="$emit('selected', model)">{{model.name}}</li>
    </ul>
</template>
<script>
  import { mapGetters } from 'vuex';

  export default {
    components: {

    },
    data() {
      return {};
    },
    computed: {
      ...mapGetters('models', [
        'filteredModels',
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
