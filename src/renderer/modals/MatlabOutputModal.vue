<template>
    <b-modal id="matlabOutputModal"
             size="lg"
             centered
             @hidden="scrollToComparison"
             header-text-variant="default"
             :no-close-on-backdrop="inProgress"
             :no-close-on-esc="inProgress">
        <h5 slot="modal-header" class="modal-title">{{ title }}</h5>

        <!-- content start -->
        <div class="container" style="height:100%;" v-chat-scroll>
            <template v-if="!error" v-for="part of stdout">
                <pre v-if="part !== '\n'">{{part}}</pre>
            </template>

            <b-alert show variant="danger" v-if="error" style="margin-top: 1rem">
                <h4 class="alert-heading">{{error.message}}</h4>

                <template v-for="frame in error.stack">
                    <hr>
                    <p class="mb-0">
                        {{frame.file.split(/[/\\]/).reverse()[0]}}, function '{{frame.name}}', line {{frame.line}}
                    </p>
                </template>
            </b-alert>
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
