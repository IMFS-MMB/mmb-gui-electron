<template>
    <div class="directory-tree-view">
        <Tree :data="treeData" @item="$emit('item', $event)"></Tree>
    </div>
</template>

<script>
  import Tree from './Tree';
  import getDirectoryTree from '../../../utils/electron/getDirectoryTree';

  export default {
    components: {
      Tree,
    },
    props: {
      base: {
        type: String,
        required: true,
      },
    },
    data() {
      return {

      };
    },

    computed: {
      treeData() {
        return getDirectoryTree(this.base, filename => !filename.endsWith('.js'));
      },
    },
  };
</script>

<style scoped lang="scss">
    .directory-tree-view {
        user-select: none;
        padding-left: 2em;
        padding-right: 1em;
    }
</style>
