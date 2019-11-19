<template>
    <b-modal id="matlabOutputModal"
             size="lg"
             centered
             @hidden="scrollToComparison"
             :header-text-variant="error ? 'danger' : 'default' "
             :no-close-on-backdrop="inProgress"
             :no-close-on-esc="inProgress">
        <h5 slot="modal-header" class="modal-title">{{ title }}</h5>

        <!-- content start -->
        <div class="container" style="height:100%;" v-chat-scroll>
            <template v-if="!error" v-for="part of stdout">
                <pre v-if="part !== '\n'">{{part}}</pre>
            </template>


            <div v-if="error">
                <h4>{{error.identifier}}</h4>
                <p>{{error.message}}</p>
            </div>
        </div>

        <button slot="modal-footer" class="btn btn-primary" :disabled="inProgress" @click="close">
            {{ inProgress ? 'Please wait...' : 'Close' }}
        </button>
    </b-modal>
</template>
<script>
  import { mapGetters } from 'vuex';
  import scrollIntoView from '../utils/scrollIntoView';

  export default {
    name: 'MatlabOutputModal',
    computed: {
      ...mapGetters('comparison', ['stdout', 'inProgress', 'error']),
      title() {
        if (this.error) {
          return 'An error has occurred!';
        }

        return this.inProgress ? 'Simulating...' : 'Simulation done';
      },
    },
    methods: {
      close() {
        this.$root.$emit('bv::hide::modal', 'matlabOutputModal');
      },
      scrollToComparison() {
        setTimeout(() => scrollIntoView('comparison'), 25);
      },
    },
  };
</script>
<style lang="scss">
    #matlabOutputModal {
        pre {
            margin: 0;
            white-space: pre-wrap;
        }

        .modal-body {
            padding: 0;
            min-height: 60vh;
            max-height: 60vh;
            display: flex;
            flex-direction: column;
        }

        .container {
            overflow-y: auto;
        }
    }
</style>
