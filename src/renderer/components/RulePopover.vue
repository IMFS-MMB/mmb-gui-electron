<template>
    <b-popover :target="'cb-rule-' + rule.name"
               :delay="{ show: 500, hide: 0 }"
               placement="left"
               :triggers="popoverTriggers"
               boundary="viewport">
        <template slot="title">Model {{rule.name}}</template>
        <div>
            <p>
                {{ ruleDescription.ac_ref }}: {{ ruleDescription.paper_title }}, <i>{{ ruleDescription.journal }}</i>
            </p>
            <p v-if="ruleDescription.description.length > 0">
                <b>Description:</b>
                {{ ruleDescription.description ? ruleDescription.description : '(no description)' }}
            </p>
        </div>
    </b-popover>
</template>
<script>
  import { mapGetters } from 'vuex';

  export default {
    name: 'RulePopover',
    props: {
      rule: {},
    },
    computed: {
      ...mapGetters('ui', ['popoverTriggers']),
      ruleDescription() {
        return this.rule.description;
      },
    },
  };
</script>
