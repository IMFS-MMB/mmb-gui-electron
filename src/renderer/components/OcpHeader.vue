<template>
    <header>
        <b-container>
            <b-row class="mt-4">
                <b-col>
                    <!--<h1>Online Comparison Platform</h1>-->

                    <p>
                    Welcome to the <a href="https://www.macromodelbase.com/" target="_blank">Macroeconomic Model Database</a>
                        <!--(MMB) Online Comparison Platform (OCP).</p> </b-col>-->
                        (MMB) v.3.0. Contribute your model using our <a href="http://www.macromodelbase.com/form/code-submission" target="_blank">Contribute Form</a> or 
                    get in touch via our 
                    <a href="https://mmb.trydiscourse.com/" target="_blank">forum</a>.
                        </p> </b-col>
                <b-col>
                    <div class="mmb-branding">
                        <a href="http://www.macromodelbase.com/" target="_blank">
                            <div class="site-logo">
                                <img src="../assets/images/logo.png" alt=" ">
                            </div>
                            <p class="site-title">Macroeconomic<br>Model Database</p>
                        </a>
                    </div>
                    <div class="text-sm-right">
                        <div @click="">
                            <a href="javascript:void(0)" v-b-modal.settingsModal>
                                <span class="m-1">Settings</span>
                                <i class="fa fa-cog"></i>
                            </a>
                        </div>
                    </div>
                </b-col>
            </b-row>
        </b-container>

    </header>
</template>

<script>

  export default {};
</script>

<style scoped lang="scss">

</style>
