<template>
    <b-container fluid class="wrapper">
        <OcpHeader/>

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
                    <b-btn variant="primary" block @click="startComparison" :disabled="!canCompare">Compare</b-btn>
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
  import SettingsModal from '@/modals/SettingsModal.vue';
  import UserSpecifiedRuleModal from '@/modals/UserSpecifiedRuleModal.vue';
  import MatlabOutputModal from '@/modals/MatlabOutputModal.vue';

  import { mapGetters, mapActions } from 'vuex';
  import Horizon from './Horizon';
  import Gain from './Gain';
  import { isElectron } from '../../constants';
  import Variables from './Variables';

  const platformComponents = isElectron ? {
    SettingsModal,
    UserSpecifiedRuleModal,
    MatlabOutputModal,
  } : {};

  export default {
    components: {
      Variables,
      Horizon,
      Gain,
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
      ...mapGetters('settings', ['canCompare']),
      ...mapGetters('comparison', {
        showComparison: 'show',
      }),
    },
    methods: {
      ...mapActions('comparison', ['compare']),
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
      }
    },
  };
</script>
