<template>
    <b-card>
        <b-card-title>Dynare</b-card-title>

        <b-form-select v-model="selectedOption" class="mb-3">
            <option :value="index" v-for="(dynare, index) in dynares">{{dynare.path}} ({{dynare.version || 'unknown version'}})
            </option>
        </b-form-select>

        <b-btn variant="primary" block @click="scan" :disabled="scanning">{{ scanning ? 'Scanning...' : 'Scan'}}</b-btn>
        <b-btn id="select-dynare-manually" variant="primary" block @click="find">Find manually</b-btn>
        <b-btn variant="warning" block @click="removeSelected" :disabled="selectedIndex === null">Remove selected
        </b-btn>

        <b-popover target="select-dynare-manually"
                   placement="top"
                   triggers="hover"
                   boundary="viewport">
            Select the root folder of your dynare installation, e.g. '{{examplePath}}'
        </b-popover>
    </b-card>
</template>
<script>
  import { mapActions, mapGetters, mapMutations } from 'vuex';
  import { platform } from 'os';

  export default {
    name: 'DynareSelection',

    computed: {
      ...mapGetters('dynare', ['dynares', 'selectedIndex', 'scanning']),
      selectedOption: {
        get() {
          return this.selectedIndex;
        },
        set(index) {
          this.select(index);
        },
      },
      examplePath() {
        switch (platform()) {
          case 'darwin': return '/usr/lib/dynare';
          case 'linux': return '/usr/lib/dynare';
          case 'win32': return 'C:\\dynare\\4.5.6';

          default: throw new Error(`(unknown platform: ${platform()})`);
        }
      },
    },
    methods: {
      ...mapMutations('dynare', ['select']),
      ...mapActions('dynare', ['scan', 'find', 'removeSelected']),
    },
    created() {
      if (!this.dynares.length) {
        this.scan();
      }
    },
  };
</script>
