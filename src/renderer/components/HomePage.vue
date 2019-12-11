<template>
    <b-container fluid class="app-wrapper pb-1">
        <OcpHeader/>

        <b-container fluid class="mt-2">
            <b-row>
                <b-col>
                    <Models/>
                </b-col>
            </b-row>

            <hr class="mt-4">

            <b-row class="mt-4">
                <b-col cols="12" sm="6" xl="3">
                    <PolicyRules/>
                </b-col>

                <b-col cols="12" sm="6" xl="3">
                    <Shocks/>
                </b-col>

                <b-col cols="12" sm="6" xl="3">
                    <Variables/>
                </b-col>

                <b-col cols="12" sm="6" xl="3">
                    <Options/>
                </b-col>
            </b-row>

            <hr class="mt-4">

            <OctaveALWarning/>
            <MissingVariableWarning/>

            <b-row class="mt-4 justify-content-center">
                <div class="col-4">
                    <div id="compare-button">
                        <b-btn variant="primary" block @click="startComparison" :disabled="!!compareDisabled">Compare
                        </b-btn>
                    </div>
                    <b-popover target="compare-button"
                               :disabled="!compareDisabled"
                               :delay="{ show: 0, hide: 0 }"
                               placement="top"
                               :triggers="popoverTriggers"
                               boundary="viewport">

                        <p class="text-danger"
                           :class="{ 'mb-0' : index === compareDisabled.hints.length - 1 }"
                           v-for="(hint, index) of compareDisabled.hints"
                           :key="hint">{{hint}}</p>
                    </b-popover>
                </div>
            </b-row>

            <b-row class="mt-4 mb-5 justify-content-center ctrl-links">
                <div class="col-4">
                    <b-row>
                        <div class="col text-center">
                            <a href="javascript:void(0)" v-b-modal.helpModal><i
                                    class="fa fa-question-circle"></i>
                                Need help?</a>
                        </div>
                    </b-row>
                </div>
            </b-row>
        </b-container>

        <Comparison/>

        <HelpModal/>

        <template v-if="$isElectron">
            <SettingsModal/>
            <UserSpecifiedRuleModal/>
            <MatlabOutputModal/>
        </template>

        <b-row>
            <b-col class="text-right">
                <small>Build time: {{buildtime}}</small>
            </b-col>
        </b-row>
    </b-container>
</template>

<script>
  import OcpHeader from '@/components/OcpHeader.vue';
  import Models from '@/components/Models.vue';
  import Shocks from '@/components/Shocks.vue';
  import PolicyRules from '@/components/PolicyRules.vue';
  import Comparison from '@/components/Comparison.vue';
  import Options from '@/components/Options.vue';

  import HelpModal from '@/modals/HelpModal.vue';
  import SettingsModal from '@/modals/settings/SettingsModal.vue';
  import UserSpecifiedRuleModal from '@/modals/UserSpecifiedRuleModal.vue';
  import MatlabOutputModal from '@/modals/MatlabOutputModal.vue';

  import { mapActions, mapGetters } from 'vuex';
  import { isElectron } from '../../config/constants';
  import Variables from './Variables';
  import OctaveALWarning from './OctaveALWarning';
  import MissingVariableWarning from './MissingVariableWarning';

  const platformComponents = isElectron ? {
    SettingsModal,
    UserSpecifiedRuleModal,
    MatlabOutputModal,
  } : {};

  export default {
    components: {
      MissingVariableWarning,
      OctaveALWarning,
      Variables,
      OcpHeader,
      Models,
      Shocks,
      Options,
      PolicyRules,
      Comparison,
      HelpModal,
      ...platformComponents,
    },
    data() {
      return {
        // eslint-disable-next-line no-underscore-dangle
        buildtime: window.__buildtime,
      };
    },
    computed: {
      ...mapGetters('backends', ['executables']),
      ...mapGetters('options', ['compareDisabled']),
      ...mapGetters('comparison', {
        showComparison: 'show',
      }),
      ...mapGetters('ui', ['popoverTriggers']),
    },
    methods: {
      ...mapActions('comparison', ['compare']),
      ...mapActions('models', ['loadModels']),
      ...mapActions('rules', ['loadRules']),
      startComparison() {
        this.$root.$emit('bv::show::modal', 'matlabOutputModal');

        this.compare();
      },
    },
    mounted() {
      if (isElectron) {
        if (!this.executables || !this.executables.length) {
          this.$root.$emit('bv::show::modal', 'settingsModal');
        }

        this.loadModels();
        this.loadRules();
      }
    },
  };
</script>
