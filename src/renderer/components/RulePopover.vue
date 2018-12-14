<template>
    <b-popover :target="'cb-rule-' + rule.id"
               :delay="{ show: 500, hide: 0 }"
               placement="left"
               triggers="hover"
               boundary="viewport">
        <template slot="title">Model {{rule.internal_name}}</template>
        <div>
            <p>
                {{ d.ac_ref }}: {{ d.paper_title }}, <i>{{ d.journal }}</i>
            </p>
            <p>{{ d.description ? d.description : '(no description)' }}</p>
        </div>
    </b-popover>
</template>
<script>
  export default {
    name: 'RulePopover',
    props: {
      rule: {},
    },
    computed: {
      d() {
        return this.rule.description;
      },
    },
  };
</script>
