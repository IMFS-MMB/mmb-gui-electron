<template>
    <form class="ctrl-search form-inline">
        <input class="form-control form-control-sm mr-2 typeahead" autocomplete="off"
               placeholder="Search" aria-label="Search" v-model="search" @keydown.enter.prevent>
    </form>
</template>
<script>
  import { mapGetters, mapMutations } from 'vuex';

  export default {
    computed: {
      ...mapGetters('search', ['text']),
      search: {
        get() {
          return this.text;
        },
        set(value) {
          this.set(value);
        },
      },
    },
    methods: {
      ...mapMutations('search', ['set']),
    },
  };
</script>