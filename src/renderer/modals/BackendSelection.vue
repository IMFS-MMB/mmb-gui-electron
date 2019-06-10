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
        <b-btn id="select-backend-manually" variant="primary" block @click="find">Find manually</b-btn>
        <b-btn variant="warning" block @click="removeSelected" :disabled="selectedIndex === null">Remove selected
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
  import { platform } from 'os';

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
      exampleMatlab() {
        switch (platform()) {
          case 'darwin':
            return '/Applications/MATLAB_R2019a.app/bin/matlab';
          case 'linux':
            return '/usr/local/bin/matlab';
          case 'win32':
            return 'C:\\Program Files\\MATLAB\\R2019a\\bin\\matlab.exe';

          default:
            throw new Error(`(unknown platform: ${platform()})`);
        }
      },
      exampleOctave() {
        switch (platform()) {
          case 'darwin':
            return '/Applications/Octave 4.4.1.app/bin/octave';
          case 'linux':
            return '/usr/bin/octave';
          case 'win32':
            return 'C:\\Octave\\4.5.6';

          default:
            throw new Error(`(unknown platform: ${platform()})`);
        }
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
