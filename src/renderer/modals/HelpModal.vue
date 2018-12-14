<template>
    <b-modal id="helpModal" size="lg" centered hide-footer>

        <h5 slot="modal-header" class="modal-title">Help</h5>
        <button slot="modal-header" class="close"><span
                aria-hidden="true" @click="hideModal">&times;</span>
        </button>


        <!-- content start -->

        <p class="lead">To get started:</p>

        <ol>
            <li>Select one or many models</li>

            <li>Select one or many policy rules</li>

            <li>Optionally select shocks and output variables</li>

            <li>Hit 'Compare'</li>
        </ol>
        <br>

        <p class="lead">Hints:</p>

        <ul>
            <li>Not all model and policy rule combinations are compatible, this is indicated by a shaded
                unavailable state
            </li>

            <li>Models which are unavailable for the current selection of shocks/prules/outputs are shaded
                gray
            </li>

            <li>Hover over any title/name to see a description of that object</li>
        </ul>
    </b-modal>
</template>
<script>
  export default {
    methods: {
      hideModal() {
        this.$root.$emit('bv::hide::modal', 'helpModal');
      },
    },
  };
</script>
