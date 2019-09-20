<template>
    <header>
        <b-container fluid>
            <b-row class="mt-4">
                <b-col>
                    <h1>Macroeconomic Model Database</h1>
                    <h4 v-if="$isWeb">Online Comparison Platform</h4>

                    <p>
                        Welcome to the
                        <a href="https://www.macromodelbase.com/" target="_blank">Macroeconomic Model Database</a>
                        (MMB) v.3.0. Contribute your model using our
                        <a href="http://www.macromodelbase.com/form/code-submission" target="_blank">Contribute Form</a>
                        or get in touch via our
                        <a href="https://mmb.trydiscourse.com/" target="_blank">forum</a>.
                    </p>
                </b-col>
                <b-col>
                    <div class="mmb-branding">
                        <a href="http://www.macromodelbase.com/" target="_blank">
                            <div class="site-logo">
                                <img src="../assets/images/logo.png" alt=" ">
                            </div>
                            <p class="site-title">Macroeconomic<br>Model Database</p>
                        </a>
                    </div>
                    <div class="text-sm-right" v-if="$isElectron">
                        <b-dropdown right class="mt-md-2" variant="outline-primary">
                            <template v-slot:button-content>
                                Menu
                            </template>
                            <b-dropdown-item v-b-modal.editorModal>
                                <i class="fa fa-edit"></i>
                                <span class="m-1">Edit Rules/Models</span>
                            </b-dropdown-item>
                            <b-dropdown-item @click="reload">
                                <i class="fa fa-refresh"></i>
                                <span class="m-1">Reload Data</span>
                            </b-dropdown-item>
                            <b-dropdown-item v-b-modal.settingsModal>
                                <i class="fa fa-cog"></i>
                                <span class="m-1">Settings</span>
                            </b-dropdown-item>
                        </b-dropdown>
                    </div>
                </b-col>
            </b-row>
        </b-container>
        <EditorModal/>
    </header>
</template>

<script>
  import { mapActions } from 'vuex';
  import EditorModal from '../modals/editor/EditorModal';

  export default {
    components: {
      EditorModal,
    },
    methods: {
      ...mapActions('rules', ['loadRules']),
      ...mapActions('models', ['loadModels']),
      reload() {
        this.loadRules();
        this.loadModels();
      },
    },
  };
</script>

<style scoped lang="scss">

</style>
