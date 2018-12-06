<template>
    <div v-if="description">
    </div>
</template>

<script>
  import { mapGetters, mapActions } from 'vuex';

  export default {
    props: {
      model: {
        default: () => {
        },
      },
    },
    data() {
      return {
        // id: `list-${nextId++}-` // eslint-disable-line
      };
    },
    computed: {
      ...mapGetters('descriptions', { getDescription: 'get' }),
      description() {
        return this.getDescription(this.model.description_id);
      },
    },
    methods: {
      ...mapActions('descriptions', ['get']),
    },
    async created() {
      // if (!this.description) {
      await this.get(this.model.description_id);
      // }
    },
  };
</script>

<style scoped>

</style>