<template>
    <b-card :class="{ dynareScanning: scanning }">
        <b-card-title>MMB Path</b-card-title>
        <p id="btn-mmb-show-folder" class="mmb-path" @click="openFolder">{{mmbFolder}}</p>

        <b-row>
            <b-col>
                <b-btn id="btn-mmb-extract" variant="primary" block @click="extractMmbFolder">Extract files</b-btn>
            </b-col>
            <b-col>
                <b-btn id="btn-mmb-select" variant="primary" block @click="selectMmbFolder">Select folder</b-btn>
            </b-col>
            <b-col>
                <b-btn id="btn-mmb-use-builtin" block @click="useBuiltinMmbFolder" variant="primary">Use builtin</b-btn>
            </b-col>
        </b-row>

        <b-popover target="btn-mmb-use-builtin"
                   placement="top"
                   triggers="hover"
                   boundary="viewport">
            Reset folder to use the default MMB files shipped with this GUI
        </b-popover>
        <b-popover target="btn-mmb-show-folder"
                   placement="top"
                   triggers="hover"
                   boundary="viewport">
            Click to show folder in the system's file explorer
        </b-popover>

        <b-popover target="btn-mmb-select"
                   placement="top"
                   triggers="hover"
                   boundary="viewport">
            Extract bundled MMB files
        </b-popover>
        <b-popover target="btn-select-mmb-manually"
                   placement="top"
                   triggers="hover"
                   boundary="viewport">
            Select an empty folder to unpack bundled mmb files
        </b-popover>
    </b-card>
</template>
<script>
  // eslint-disable-next-line import/no-extraneous-dependencies
  import { remote } from 'electron';
  import { mapActions, mapGetters, mapMutations } from 'vuex';
  import { exampleDynare } from '../../../config/paths';

  export default {
    data() {
      return {
        exampleDynare,
        scanning: false,
      };
    },
    computed: {
      ...mapGetters('settings', ['mmbFolder']),
    },
    methods: {
      ...mapMutations('settings', []),
      ...mapActions('settings', ['extractMmbFolder', 'useBuiltinMmbFolder', 'selectMmbFolder']),
      openFolder() {
        remote.shell.showItemInFolder(this.mmbFolder);
      },
    },
    created() {

    },
  };
</script>

<style lang="scss" scoped>
    .mmb-path {
        cursor: pointer;
    }
</style>
