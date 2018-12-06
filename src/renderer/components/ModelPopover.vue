<template>
    <b-popover :target="'cb-wrapper-' + id + model.id"
               :delay="{ show: 500, hide: 0 }"
               placement="left"
               triggers="hover"
               boundary="viewport">
        <template slot="title">Model {{model.internal_name}}</template>
        <div>
            <span>{{ model.description && model.description.description || '(no description)'}}</span>
        </div>
    </b-popover>
</template>
<script>
  import ModelPopoverContent from '@/components/ModelPopoverContent.vue';

  export default {
    name: 'ModelPopover',
    components: {
      ModelPopoverContent,
    },
    props: {
      id: {},
      model: {},
    },
  };
</script>
