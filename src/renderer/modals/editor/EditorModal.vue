<template>
    <b-modal id="editorModal"
             size="xl"
             centered
             lazy
             no-close-on-backdrop
             no-close-on-esc
             ok-title="Close"
             ok-only>

        <template slot="modal-header">
            <span class="font-weight-bold" v-if="file">Current file: {{relativeFilePath}}</span><span v-else>Select a file to edit</span>
            <span class="flex-grow-1"></span>
            <b-button variant="primary" :disabled="!file" @click="saveFile">Save</b-button>
        </template>

        <div class="content-wrapper d-flex flex-row align-items-stretch">
            <div class="overflow-auto flex-grow-1 pretty-scroll">
                <DirectoryView class="directory-view"
                               :base="modelsFolder"
                               @item="loadFile"/>
            </div>
            <div class="d-flex flex-grow-1 overflow-hidden">
                <MonacoEditor class="monaco"
                              v-model="code"
                              :language="monacoLanguage"
                              :options="monacoOptions"/>
            </div>
        </div>
    </b-modal>
</template>
<script>
  import { mapGetters } from 'vuex';
  import { writeFile, readFileSync } from 'fs-extra';
  import path from 'path';
  import MonacoEditor from './MonacoEditor';
  import DirectoryView from './DirectoryView/DirectoryView';

  export default {
    components: {
      MonacoEditor,
      DirectoryView,
    },
    data() {
      return {
        code: '',
        file: null,
        monacoOptions: {
          automaticLayout: true,
        },
      };
    },
    computed: {
      ...mapGetters('models', ['models']),
      ...mapGetters('rules', ['rules']),
      ...mapGetters('settings', ['modelsFolder', 'rulesFolder']),
      relativeFilePath() {
        return this.file ? path.relative(this.modelsFolder, this.file.path) : null;
      },
      monacoLanguage() {
        if (!this.file) {
          return 'plaintext';
        }

        const ext = path.extname(this.file.path);

        switch (ext) {
          case '.json': {
            return 'json';
          }
          default: {
            return 'default';
          }
        }
      },
    },
    methods: {
      loadFile(file) {
        this.file = file;
        this.code = readFileSync(file.path, { encoding: 'utf8' });
      },
      async saveFile() {
        try {
          await writeFile(this.file.path, this.code, {
            encoding: 'utf8',
          });

          this.success('File saved.', 'Success');
        } catch (e) {
          this.error(`There was an error saving your file:\n${e.message}`, 'Error');
          throw e;
        }
      },
      success(message, title) {
        this.$bvToast.toast(message, {
          title,
          autoHideDelay: 3000,
          solid: true,
          variant: 'success',
          appendToast: false,
        });
      },
      error(message, title) {
        this.$bvToast.toast(message, {
          title,
          autoHideDelay: 3000,
          solid: true,
          variant: 'error',
          appendToast: false,
        });
      },
    },
  };
</script>

<style lang="scss">
    #editorModal {
        .modal-header {
            align-items: center;
            justify-content: flex-start;

            > :not(:first-child) {
                margin-left: .5em;
            }
        }

        .modal-body {
            padding: 0;
            height: 70vh;

            .monaco {
                height: 100%;
                width: 100%;
            }
        }

        .content-wrapper {
            height: 100%;
            width: 100%;
        }
    }
</style>
