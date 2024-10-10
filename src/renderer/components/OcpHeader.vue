<template>
    <header>
        <b-container fluid>
            <b-row class="mt-4">
                <b-col cols="12" md="5" order-md="last">
                    <div class="row mmb-branding">
                        <div class="col">
                            <a class="d-flex align-items-center justify-content-start justify-content-md-end" href="http://www.macromodelbase.com/" target="_blank">
                                <img class="site-logo mr-3" src="../assets/images/logo.png" alt=" ">
                                <p class="site-title text-nowrap">Macroeconomic<br>Model Database</p>
                            </a>
                        </div>
                        <b-col cols="auto" md="12" class="d-flex justify-content-end">
                            <div v-if="$isElectron">
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
                                    <hr>
                                    <b-dropdown-item v-b-modal.helpModal>
                                        <i class="fa fa-question-circle"></i>
                                        <span class="m-1">Help</span>
                                    </b-dropdown-item>
                                </b-dropdown>
                            </div>
                        </b-col>
                    </div>
                </b-col>
                <b-col cols="12" md="7">
                    <h1 class="mt-3 mt-md-0 d-none d-md-block">Macroeconomic Model&nbsp;Database</h1>
                    <h4 v-if="$isWeb">Online Comparison Platform</h4>

                    <p class="mt-md-0 mt-4">
                        Welcome to the
                        <a href="https://www.macromodelbase.com/" target="_blank">Macroeconomic Model Database</a>
                        (MMB) v.3.3. Contribute your model using our
                        <a href="http://www.macromodelbase.com/form/code-submission" target="_blank">Contribute Form</a>
                        or get in touch via our
                        <a href="https://mmb.trydiscourse.com/" target="_blank">forum</a>.
                    </p>
                </b-col>
            </b-row>
        </b-container>
        <template v-if="$isElectron">
            <EditorModal/>
        </template>
    </header>
</template>

<script>
  import { mapActions } from 'vuex';


  const platformComponents = !process.env.IS_WEB ? {
    EditorModal: require('../modals/editor/EditorModal').default,
  } : {};

  export default {
    components: {
      ...platformComponents,
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
