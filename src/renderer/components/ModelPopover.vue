<template>
    <b-popover :target="'cb-wrapper-' + model.name"
               :delay="{ show: 500, hide: 0 }"
               placement="left"
               :triggers="popoverTriggers"
               boundary="viewport">
        <template slot="title">Model {{model.name}}</template>
        <div>
            <p>
                {{ modelDescription.ac_ref }}: {{ modelDescription.paper_title }}, <i>{{ modelDescription.journal }}</i>
            </p>
            <p v-if="modelDescription.description.length > 0">
                <b>Description:</b>
                {{ modelDescription.description ? modelDescription.description : '(no description)' }}
            </p>
        </div>
    </b-popover>
</template>
<script>
  import { mapGetters } from 'vuex';

  export default {
    name: 'ModelPopover',
    props: {
      model: {},
    },
    computed: {
      ...mapGetters('ui', ['popoverTriggers']),
      modelDescription() {
        return this.model.description;
      },
    },
  };
</script>
<style scoped lang="scss">
    p:last-of-type {
        margin-bottom: 0 !important;
    }
</style>
