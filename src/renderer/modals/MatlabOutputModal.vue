<template>
    <b-modal id="matlabOutputModal" size="lg" centered :no-close-on-backdrop="inProgress" :no-close-on-esc="inProgress">
        <h5 slot="modal-header" class="modal-title">{{ inProgress ? 'Simulating...' : 'Simulation done' }}</h5>

        <!-- content start -->
        <div class="container" v-chat-scroll>
            <pre v-for="part of stdout">{{part}}</pre>
        </div>

        <button slot="modal-footer" class="btn btn-primary" :disabled="inProgress" @click="close">{{ inProgress ? 'Please wait...' : 'Close' }}</button>
    </b-modal>
</template>
<script>
  import { mapActions, mapGetters, mapMutations } from 'vuex'; // eslint-disable-line

  export default {
    name: 'MatlabOutputModal',
    computed: {
      ...mapGetters('comparison', ['stdout', 'inProgress']),
    },
    methods: {
      close() {
        this.$root.$emit('bv::hide::modal', 'matlabOutputModal');
      },
    },
  };
</script>
<style lang="scss">
    #matlabOutputModal {
        .modal-content {
            max-height: 80vh;
        }

        .modal-header, .modal-footer {
            flex-shrink: 0;
        }

        .modal-body {
            display: flex;
            flex-direction: column;
            padding: 0;
        }

        .container {
            flex: 1;
            overflow: auto;
            padding-bottom: 1rem;

            pre {
                margin-bottom: 0;
                white-space: pre-wrap;
            }
        }
    }
</style>
