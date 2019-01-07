<template>
    <div class="ctrl-set ctrl-set-shocks">
        <div class="ctrl-set-header">
            <div class="ctrl-set-title">
                Shocks
                <small class="ctrl-set-stats">({{selectedIndex}}/{{total}} Selected)</small>
                <a href="javascript:void(0)" class="ctrl-set-clear" @click="clear">&nbsp;Clear</a>
            </div>
        </div>

        <div class="ctrl-set-body">
            <b-form-checkbox-group class="ctrl-set-listing" stacked v-model="selection">
                <b-form-checkbox v-for="shock in shocks"
                                 :key="shock.id"
                                 :value="shock">
                    {{shock.text}}
                </b-form-checkbox>
            </b-form-checkbox-group>
        </div>
    </div>
</template>
<script>
  import { mapMutations, mapGetters, mapActions } from 'vuex'; // eslint-disable-line no-unused-vars
  import shocks from '@/data/shocks';

  export default {
    data() {
      return {
        shocks,
      };
    },
    computed: {
      ...mapGetters('selections', {
        selectedIndex: 'numShocks',
        shockSelection: 'shocks',
      }),
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
      ...mapMutations('selections', {
        clear: 'clearShocks',
        setShocks: 'setShocks',
      }),
    },
  };
</script>
