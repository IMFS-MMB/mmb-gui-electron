<template>
    <div>
        <b-dropdown
                id="comparison-data-order-dropdown"
                boundary="viewport"
                class="mt-md-2"
                variant="outline-primary">
            <template v-slot:button-content>
                Group Data
            </template>
            <b-dropdown-item @click="setOrder(orders.VariableModelRule)">
                <i class="fa fa-check" v-if="order === orders.VariableModelRule"></i>
                <span >Variable</span>
            </b-dropdown-item>
            <b-dropdown-item @click="setOrder(orders.ModelRuleVariable)">
                <i class="fa fa-check" v-if="order === orders.ModelRuleVariable"></i>
                <span >Model</span>
            </b-dropdown-item>
            <b-dropdown-item @click="setOrder(orders.RuleModelVariable)">
                <i class="fa fa-check" v-if="order === orders.RuleModelVariable"></i>
                <span >Rule</span>
            </b-dropdown-item>
        </b-dropdown>
        <b-tooltip target="comparison-data-order-dropdown" triggers="hover focus">
            Define how data is grouped. Default is one chart per variable.
        </b-tooltip>
    </div>
</template>
<script>
  import { mapGetters, mapMutations } from 'vuex';
  import orders from '../data/orders';


  export default {
    data() {
      return {
        orders,
      };
    },
    computed: {
      ...mapGetters('comparison', ['order']),
    },
    methods: {
      ...mapMutations('comparison', ['setOrder']),
    },
  };
</script>
