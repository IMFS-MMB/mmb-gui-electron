<template>
    <b-card :class="{ backendScanning: scanning }">
        <b-card-title>
            Matlab/Octave
        </b-card-title>
        <p class="lead"></p>

        <b-form-select v-model="selectedOption" class="mb-3" :disabled="scanning">
            <option :value="index" v-for="(executable, index) in executables">
                {{executable.path}} ({{executable.ver}})
            </option>
        </b-form-select>

        <b-row>
            <b-col>
                <b-btn id="btn-backend-scan" variant="primary" block @click="startScan" :disabled="scanning">
                    {{ scanning ? 'Scanning...' : 'Scan'}}
                </b-btn>
            </b-col>
            <b-col>
                <b-btn id="btn-backend-select" variant="primary" :disabled="scanning" block @click="find">
                    Find manually
                </b-btn>
            </b-col>
            <b-col>
                <b-btn variant="warning" block @click="removeSelected" :disabled="scanning || selectedIndex === null">
                    Remove selected
                </b-btn>
            </b-col>
        </b-row>


        <b-popover target="btn-backend-scan"
                   placement="top"
                   triggers="hover"
                   boundary="viewport">
            <p>
                Scan for executables automatically. Depending on your system this can take up to several minutes.
            </p>
            <p>
              <strong>Your installation may not be detected if it's in an uncommon location.</strong>
            </p>
            <p v-if="isWindows">You might see flashing MATLAB windows in the process. Please don't close them manually.</p>
        </b-popover>

        <b-popover target="btn-backend-select"
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
  import { platform } from 'os';
  import { exampleMatlab, exampleOctave } from '../../../config/paths';

  export default {
    name: 'BackendSelection',
    data() {
      return {
        exampleMatlab,
        exampleOctave,
        scanning: false,
        isWindows: platform() === 'win32',
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
