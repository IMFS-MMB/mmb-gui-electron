<template>
    <b-card>
        <b-card-title>
            Matlab/Octave
        </b-card-title>
        <p class="lead"></p>

        <b-form-select v-model="selectedOption" class="mb-3">
            <option :value="index" v-for="(executable, index) in executables">{{executable.path}}
                ({{executable.ver}})
            </option>
        </b-form-select>

        <b-btn variant="primary" block @click="scan" :disabled="scanning">{{ scanning ? 'Scanning...' : 'Scan'}}
        </b-btn>
        <b-btn variant="primary" block @click="find">Find manually</b-btn>
        <b-btn variant="warning" block @click="removeSelected" :disabled="selectedIndex === null">Remove selected</b-btn>
    </b-card>
</template>
<script>
  import { mapActions, mapGetters, mapMutations } from 'vuex';

  export default {
    name: 'BackendSelection',

    computed: {
      ...mapGetters('backends', ['executables', 'selectedIndex', 'scanning']),
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
      ...mapMutations('backends', ['select']),
      ...mapActions('backends', ['scan', 'find', 'removeSelected']),
    },
    created() {
      if (!this.executables.length) {
        this.scan();
      }
    },
  };
</script>
