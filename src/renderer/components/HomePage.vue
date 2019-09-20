<template>
    <b-container fluid class="app-wrapper">
        <OcpHeader/>

        <MalformedDataWarning/>

        <b-container fluid class="mt-2">
            <b-row>
                <b-col>
                    <Models/>
                </b-col>
            </b-row>

            <hr class="mt-4">

            <b-row class="mt-4">
                <b-col>
                    <PolicyRules/>
                </b-col>

                <b-col>
                    <Shocks/>
                </b-col>

                <b-col>
                    <Variables/>
                </b-col>

                <b-col>
                    <Options/>
                </b-col>
            </b-row>

            <hr class="mt-4">

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
                               triggers="hover"
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
  import { isElectron } from '../../constants';
  import Variables from './Variables';
  import MalformedDataWarning from './MalformedDataWarning';

  const platformComponents = isElectron ? {
    SettingsModal,
    UserSpecifiedRuleModal,
    MatlabOutputModal,
  } : {};

  export default {
    components: {
      MalformedDataWarning,
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
    computed: {
      ...mapGetters('backends', ['executables']),
      ...mapGetters('options', ['compareDisabled']),
      ...mapGetters('comparison', {
        showComparison: 'show',
      }),
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
