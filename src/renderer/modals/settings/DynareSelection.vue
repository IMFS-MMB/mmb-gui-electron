<template>
    <b-card :class="{ dynareScanning: scanning }">
        <b-card-title>Dynare</b-card-title>

        <b-form-select v-model="selectedOption" class="mb-3" :disabled="scanning">
            <option :value="index" v-for="(dynare, index) in dynares">{{dynare.path}} ({{dynare.version || 'unknown version'}})
            </option>
        </b-form-select>

        <b-btn variant="primary" block @click="startScan" :disabled="scanning">{{ scanning ? 'Scanning...' : 'Scan'}}</b-btn>
        <b-btn id="select-dynare-manually" variant="primary" :disabled="scanning" block @click="find">Find manually</b-btn>
        <b-btn variant="warning" block @click="removeSelected" :disabled="scanning || selectedIndex === null">Remove selected
        </b-btn>

        <b-popover target="select-dynare-manually"
                   placement="top"
                   triggers="hover"
                   boundary="viewport">
            Select the root folder of your dynare installation, e.g. '{{exampleDynare}}'
        </b-popover>
    </b-card>
</template>
<script>
  import { mapActions, mapGetters, mapMutations } from 'vuex';
  import { exampleDynare } from '../../../config/paths';

  export default {
    name: 'DynareSelection',
    data() {
      return {
        exampleDynare,
        scanning: false,
      };
    },
    computed: {
      ...mapGetters('dynare', ['dynares', 'selectedIndex']),
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
      async startScan() {
        this.scanning = true;

        try {
          await this.scan();
        } catch (e) {
          throw e;
        } finally {
          this.scanning = false;
        }
      },
    },
    created() {
      if (!this.dynares.length) {
        // this.scan();
      }
    },
  };
</script>

<style lang="scss">
    .dynareScanning, .dynareScanning * {
        cursor: wait !important;
    }
</style>
