<template>
    <div class="directory-tree-view">
        <Tree v-if="treeData" :data="treeData" @item="$emit('item', $event)"></Tree>
    </div>
</template>

<script>
  import { FSWatcher } from 'chokidar';
  import Tree from './Tree';
  import getDirectoryTree from '../../../utils/getDirectoryTree';

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
        watcher: null,
        treeData: null,
      };
    },
    methods: {
      update() {
        this.treeData = getDirectoryTree(this.base, filename => !filename.endsWith('.js'));
      },
    },
    beforeDestroy() {
      this.watcher.close();
    },
    created() {
      this.watcher = new FSWatcher({
        cwd: '/',
        ignoreInitial: true,
      });

      this.watcher.add(this.base);

      this.watcher.on('ready', () => this.update());
      this.watcher.on('all', (eventname) => {
        if (eventname !== 'change') { this.update(); }
      });
    },
  };
</script>

<style scoped lang="scss">
    .directory-tree-view {
        user-select: none;
    }
</style>
