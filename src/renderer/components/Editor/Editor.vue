<template>
    <div>
        <div class="editor-container d-flex flex-row align-items-stretch" style="max-height: 60vh;">
            <div class="flex-grow-1 d-flex flex-column align-items-stretch" style="width: 100%;">
                <div class="flex-shrink-0 mb-3 d-flex flex-row align-items-center">
                    <h4 class="mr-5 mb-0 ml-4">Current file: {{file ? file.name : 'none' }}</h4>
                    <span class="flex-grow-1"></span>
                    <b-btn variant="primary">Save</b-btn>
                </div>
                <div class="d-flex flex-row align-items-stretch">
                    <div class="overflow-auto flex-grow-1 pretty-scroll">
                        <DirectoryView class="directory-view"
                                       :base="baseDir"
                                       @item="setFile">
                        </DirectoryView>
                    </div>
                    <div class="d-flex flex-grow-1 overflow-hidden">
                        <MonacoEditor class="monaco"
                                      :language="monacoLanguage"
                                      v-model="code"
                                      :options="monacoOptions">
                        </MonacoEditor>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
  import fs from 'fs';
  import path from 'path';

  import MonacoEditor from '../MonacoEditor';
  import DirectoryView from './DirectoryView/DirectoryView';
  import ModelsDropdown from './ModelsDropdown';
  import ModelsList from './ModelsList';

  import { modelsFolder } from '../../../../config/paths';

  export default {
    components: {
      ModelsList,
      ModelsDropdown,
      DirectoryView,
      MonacoEditor,
    },
    data() {
      return {
        code: 'const noop = () => {}',
        file: null,
        monacoOptions: {
          automaticLayout: true,
        },
        baseDir: modelsFolder,
      };
    },
    computed: {
      monacoLanguage() {
        if (!this.file) {
          return '';
        }

        const ext = path.extname(this.file.path);

        switch (ext) {
          case '.json': {
            return 'json';
          }
          default: {
            return '';
          }
        }
      },
    },
    methods: {
      setFile(file) {
        this.file = file;
        this.code = fs.readFileSync(file.path, { encoding: 'utf8' });
      },
    },
    watch: {

    },
    mounted() {
    },
  };
</script>

<style scoped lang="scss">
    .directory-view {
        overflow-y: auto;
        flex-shrink: 0;

        &::-webkit-scrollbar {
            -webkit-appearance: none;
            width: 7px;
        }

        &::-webkit-scrollbar-thumb {
            border-radius: 4px;
            background-color: rgba(0, 0, 0, .5);
            -webkit-box-shadow: 0 0 1px rgba(255, 255, 255, .5);
        }
    }

    .editor-container {
        height: 60vh;
    }

    .monaco {
        width: 100%;
    }

    .pretty-scroll {
        &::-webkit-scrollbar {
            -webkit-appearance: none;
            width: 7px;
        }
        &::-webkit-scrollbar-thumb {
            border-radius: 4px;
            background-color: rgba(0,0,0,.5);
            -webkit-box-shadow: 0 0 1px rgba(255,255,255,.5);
        }
    }
</style>
