import Vue from 'vue';

import * as monaco from 'monaco-editor/esm/vs/editor/editor.main';

const MonacoEditor = {
  name: 'MonacoEditor',

  props: {
    original: String,
    value: {
      type: String,
      required: true,
    },
    theme: {
      type: String,
      default: 'vs',
    },
    language: String,
    options: Object,
    amdRequire: {
      type: Function,
    },
    diffEditor: {
      type: Boolean,
      default: false,
    },
  },

  model: {
    event: 'change',
  },

  watch: {
    options: {
      deep: true,
      handler(options) {
        if (this.editor) {
          const editor = this.getModifiedEditor();
          editor.updateOptions(options);
        }
      },
    },

    value(newValue) {
      if (this.editor) {
        const editor = this.getModifiedEditor();
        if (newValue !== editor.getValue()) {
          editor.setValue(newValue);
        }
      }
    },

    language(newVal) {
      if (this.editor) {
        const editor = this.getModifiedEditor();
        monaco.editor.setModelLanguage(editor.getModel(), newVal);
      }
    },

    theme(newVal) {
      if (this.editor) {
        monaco.editor.setTheme(newVal);
      }
    },
  },

  mounted() {
    this.initMonaco();
  },


  beforeDestroy() {
    if (this.editor) {
      this.editor.dispose();
    }
  },

  methods: {
    initMonaco() {
      this.$emit('editorWillMount', monaco);

      const options = Object.assign(
        {
          value: this.value,
          theme: this.theme,
          language: this.language,
        },
        this.options,
      );

      if (this.diffEditor) {
        this.editor = monaco.editor.createDiffEditor(this.$el, options);
        const originalModel = monaco.editor.createModel(
          this.original,
          this.language,
        );
        const modifiedModel = monaco.editor.createModel(
          this.value,
          this.language,
        );
        this.editor.setModel({
          original: originalModel,
          modified: modifiedModel,
        });
      } else {
        this.editor = monaco.editor.create(this.$el, options);
      }

      // @event `change`
      const editor = this.getModifiedEditor();
      editor.onDidChangeModelContent((event) => {
        const value = editor.getValue();
        if (this.value !== value) {
          this.$emit('change', value, event);
        }
      });

      this.$emit('editorDidMount', this.editor);
    },

    getModifiedEditor() {
      return this.diffEditor ? this.editor.getModifiedEditor() : this.editor;
    },

    focus() {
      this.editor.focus();
    },
  },

  render(h) {
    return h('div');
  },
};

export default MonacoEditor;

Vue.component(MonacoEditor.name, MonacoEditor);
