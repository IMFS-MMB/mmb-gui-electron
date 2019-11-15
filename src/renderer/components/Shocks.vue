<template>
    <div class="ctrl-set ctrl-set-shocks">
        <div class="ctrl-set-header">
            <span class="ctrl-set-title">Shocks</span>
            <small class="ctrl-set-stats">({{numSelected}}/{{total}})</small>
            <a href="javascript:void(0)" class="ctrl-set-clear" @click="selectAll">Select all</a>
            <a href="javascript:void(0)" class="ctrl-set-clear" @click="clear">&nbsp;Clear</a>
        </div>

        <div class="ctrl-set-body">
            <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="selection">
                <b-form-checkbox v-for="shock in shocks"
                                 :key="shock.name"
                                 :value="shock">
                    {{shock.text}}
                </b-form-checkbox>
                <template v-if="modelSpecificShocksUnavailable">
                    <div id="model-specific-shocks-unavailable" >
                        <b-form-checkbox :value="null" :disabled="true" >
                            Model Specific Shocks
                        </b-form-checkbox>
                    </div>
                    <b-popover target="model-specific-shocks-unavailable"
                               :delay="{ show: 250, hide: 0 }"
                               placement="left"
                               triggers="hover"
                               boundary="viewport">
                        <div>
                            <p>Model specific shocks are unavailable with the current options.</p>
                            <p class="mb-0">Select <em>exactly one</em> model to make its specific shocks available.</p>
                        </div>
                    </b-popover>
                </template>
            </b-form-checkbox-group>
        </div>
    </div>
</template>
<script>
  import { mapMutations, mapGetters } from 'vuex';
  import intersection from '../utils/intersection';
  import partition from '../utils/partition';

  export default {
    computed: {
      ...mapGetters('options', ['modelSpecificShocksUnavailable']),
      ...mapGetters('options', {
        numSelected: 'numShocks',
        shockSelection: 'shocks',
        modelSelection: 'models',
      }),
      shocks() {
        const shocks = this.modelSelection.map(model => model.shocks);
        const common = intersection(shocks, shock => shock.text);

        const [humanReadable, nonHumanReadable] =
          partition(common, shock => shock.text !== shock.name);

        return humanReadable.concat(nonHumanReadable);
      },
      selection: {
        get() {
          return this.shockSelection;
        },
        set(value) {
          this.setShocks(value);
        },
      },

      total() {
        return this.shocks.length;
      },
    },
    methods: {
      ...mapMutations('options', {
        clear: 'clearShocks',
        setShocks: 'setShocks',
      }),
      selectAll() {
        this.setShocks(this.shocks);
      },
    },
  };
</script>
