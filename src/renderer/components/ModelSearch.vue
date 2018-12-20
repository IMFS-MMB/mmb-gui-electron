<template>
    <form class="ctrl-search form-inline">
        <input id="search" class="form-control form-control-sm mr-2 typeahead" autocomplete="off"
               placeholder="Search models..." aria-label="Search" v-model="search" @keydown.enter.prevent>
        <b-popover target="search"
                   :delay="{ show: 500, hide: 0 }"
                   placement="left"
                   triggers="hover"
                   boundary="viewport">
            Search models by name, title, paper, authors, year of publication...
        </b-popover>
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
