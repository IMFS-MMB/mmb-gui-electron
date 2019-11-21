import Vue from 'vue'
import Vuex from 'vuex'
import { name } from './name.js'
import { tree } from './tree.js'
import comments from './comments';

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    dark: false,
    //replace this with your own github directory
    github: 'sdras/project-explorer',
    //this lets us know which files to highlight, to open on first visit
    opened: [name],
    //this will show any comments that are relevant to a particular file
    comments,
    //the whole directory structure and name of the project
    tree,
    name
  },
  mutations: {
    toggleOpened(state, name) {
      if (state.opened.includes(name)) {
        state.opened = state.opened.filter(e => e !== name)
      } else {
        state.opened.push(name)
      }
    },
    toggleDark(state) {
      state.dark = !state.dark
    }
  }
})
