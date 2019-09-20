<template>
    <b-card :class="{ backendScanning: scanning }">
        <b-card-title>
            Matlab/Octave
        </b-card-title>
        <p class="lead"></p>

        <b-form-select v-model="selectedOption" class="mb-3" :disabled="scanning">
            <option :value="index" v-for="(executable, index) in executables">{{executable.path}}
                ({{executable.ver}})
            </option>
        </b-form-select>

        <b-btn variant="primary" block @click="startScan" :disabled="scanning">{{ scanning ? 'Scanning...' : 'Scan'}}
        </b-btn>
        <b-btn id="select-backend-manually" variant="primary" :disabled="scanning" block @click="find">Find manually</b-btn>
        <b-btn variant="warning" block @click="removeSelected" :disabled="scanning || selectedIndex === null">Remove selected
        </b-btn>

        <b-popover target="select-backend-manually"
                   placement="top"
                   triggers="hover"
                   boundary="viewport">
            <p>
                Select the MATLAB or Octave executable.
            </p>
            <p>
                Examples<br>
                MATLAB: {{ exampleMatlab }}<br>
                Octave: {{ exampleOctave }}
            </p>
        </b-popover>
    </b-card>
</template>
<script>
  import { mapActions, mapGetters, mapMutations } from 'vuex';
  import { exampleMatlab, exampleOctave } from '../../../config/paths';

  export default {
    name: 'BackendSelection',
    data() {
      return {
        exampleMatlab,
        exampleOctave,
        scanning: false,
      };
    },
    computed: {
      ...mapGetters('backends', ['executables', 'selectedIndex']),
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
      async startScan() {
        this.scanning = true;

        await this.scan();

        this.scanning = false;
      },
    },

    created() {
      if (!this.executables.length) {
        this.scan();
      }
    },
  };
</script>
<style lang="scss">
    .backendScanning, .backendScanning * {
        cursor: wait !important;
    }
</style>
