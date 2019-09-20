<template>
    <div>
        <TreeItem :item="data"
                  :active-item="activeItem"
                  :depth="1"
                  :last="true"
                  @item="onItem"></TreeItem>
    </div>
</template>

<script>
  import TreeItem from './TreeItem';

  export default {
    components: { TreeItem },
    props: {
      data: {
        type: Object,
      },
    },
    data() {
      return {
        activeItem: null,
      };
    },
    methods: {
      onItem(item) {
        this.$emit('item', item);
        this.activeItem = item;
      },
    },
  };
</script>

<style scoped lang="scss">
    .text {
        font-size: 0.9rem;
        padding-left: 8px;
    }
</style>
