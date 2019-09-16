<template>
    <div>
        <TreeItem :item="data" :depth="1" :last="true" @item="$emit('item', $event)"></TreeItem>
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
  };
</script>

<style scoped lang="scss">
    .text {
        font-size: 0.9rem;
        padding-left: 8px;
    }
</style>
