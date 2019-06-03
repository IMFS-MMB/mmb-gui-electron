<template>
    <div class="ctrl-set ctrl-set-shocks">
        <div class="ctrl-set-header">
            <div class="ctrl-set-title">
                Shocks
                <small class="ctrl-set-stats">({{numSelected}}/{{total}} Selected)</small>
                <a href="javascript:void(0)" class="ctrl-set-clear" @click="selectAll">Select all</a>
                <a href="javascript:void(0)" class="ctrl-set-clear" @click="clear">&nbsp;Clear</a>
            </div>
        </div>

        <div class="ctrl-set-body">
            <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="selection">
                <b-form-checkbox v-for="shock in shocks"
                                 :key="shock.name"
                                 :value="shock">
                    {{shock.text}}
                </b-form-checkbox>
            </b-form-checkbox-group>
        </div>
    </div>
</template>
<script>
  import { mapMutations, mapGetters, mapActions } from 'vuex'; // eslint-disable-line no-unused-vars
  import commonShocks from '@/data/shocks';

  export default {
    computed: {
      ...mapGetters('settings', {
        numSelected: 'numShocks',
        shockSelection: 'shocks',
        modelSelection: 'models',
      }),
      shocks() {
        if (this.modelSelection.length !== 1) {
          return commonShocks;
        }

        return [
          ...commonShocks,
          ...this.modelSelection[0].shocks.filter(s => !commonShocks.some(cs => cs.name === s.name)),
        ];
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
      ...mapMutations('settings', {
        clear: 'clearShocks',
        setShocks: 'setShocks',
      }),
      selectAll() {
        this.setShocks(this.shocks);
      },
    },
  };
</script>
