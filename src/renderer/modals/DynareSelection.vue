<template>
    <b-card>
        <b-card-title>Dynare</b-card-title>

        <b-form-select v-model="selectedOption" class="mb-3">
            <option :value="index" v-for="(path, index) in paths">{{path}}</option>
        </b-form-select>

        <b-btn variant="primary" block @click="scan" :disabled="scanning">{{ scanning ? 'Scanning...' : 'Scan'}}</b-btn>
        <b-btn variant="primary" block @click="find">Find manually</b-btn>
        <b-btn variant="warning" block @click="removeSelected" :disabled="selectedIndex === null">Remove selected</b-btn>
    </b-card>
</template>
<script>
  import { mapActions, mapGetters, mapMutations } from 'vuex';

  export default {
    name: 'DynareSelection',

    computed: {
      ...mapGetters('dynare', ['paths', 'selectedIndex', 'scanning']),
      selectedOption: {
        get() {
          return this.selectedIndex;
        },
        set(index) {
          this.select(index);
        },
      },
    },
    methods: {
      ...mapMutations('dynare', ['select']),
      ...mapActions('dynare', ['scan', 'find', 'removeSelected']),
    },
    created() {
      if (!this.paths.length) {
        this.scan();
      }
    },
  };
</script>
