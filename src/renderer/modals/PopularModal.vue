<template>
    <b-modal id="popularModal" size="lg" centered hide-footer>
        <h5 slot="modal-header" class="modal-title">Popular comparisons</h5>
        <button slot="modal-header" class="close"><span
                aria-hidden="true">&times;</span>
        </button>


        <!-- content start -->

        <ol>
            <li><a href="#">model name 4, model name 5, policy rule 2</a></li>

            <li><a href="#">model name 23, policy rule 1, policy rule 8</a></li>

            <li><a href="#">model name 23, policy rule 1, policy rule 7, policy rule 8</a></li>
        </ol>

        <div slot="modal-footer"></div>
    </b-modal>
</template>
<script>
export default {};
</script>