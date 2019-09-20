<template>
    <div v-if="model">
        <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="statesModel">
            <b-form-checkbox v-for="state in model.al_info.states_long" :key="model.al_info.states_long" :value="state">{{state}}</b-form-checkbox>
        </b-form-checkbox-group>
    </div>
</template>
<script>
  // eslint-disable-next-line no-unused-vars
  import { mapMutations, mapGetters, mapActions } from 'vuex';

  export default {
    name: 'ModelStates',
    props: {
      model: {},
    },
    computed: {
      ...mapGetters('options', ['states']),
      statesModel: {
        get() {
          return this.model ? this.states(this.model.name) : [];
        },
        set(states) {
          this.setStates({ modelname: this.model.name, states });
        },
      },
    },
    methods: {
      ...mapMutations('options', [
        'setStates',
      ]),
    },
  };
</script>
