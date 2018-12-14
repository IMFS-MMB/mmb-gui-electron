<template>
    <b-modal id="settingsModal" size="lg" centered ok-only>
        <h5 slot="modal-header" class="modal-title">Settings</h5>
        <button slot="modal-header" class="close" @click="hideModal"><span
                aria-hidden="true">&times;</span>
        </button>


        <!-- content start -->

        <p class="lead">Select Matlab/Octave version:</p>

        <b-form-select v-model="selectedOption" class="mb-3">
            <option :value="index" v-for="(executable, index) in executables">{{executable.path}} ({{executable.ver}})
            </option>
        </b-form-select>

        <b-btn variant="primary" block @click="scan" :disabled="scanning">{{ scanning ? 'Scanning...' : 'Scan'}}</b-btn>
        <b-btn variant="primary" block @click="find">Find manually</b-btn>
    </b-modal>
</template>
<script>
  import { mapActions, mapGetters, mapMutations } from 'vuex';

  export default {
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
      ...mapActions('backends', ['scan', 'find']),
      hideModal() {
        this.$root.$emit('bv::hide::modal', 'settingsModal');
      },
    },
    created() {
      if (!this.executables.length) {
        this.scan();
      }
    },
  };
</script>
