<template>
    <div>
        <b-btn id="btn-mmb-check-compat" slot="modal-footer" @click="checkCompat">

            <template v-if="running">
                <b-spinner small></b-spinner>
                <span>Checking compatibility, please wait.</span>
            </template>
            <span v-else>Check compatibility</span>
        </b-btn>
        <b-popover target="btn-mmb-check-compat"
                   placement="top"
                   triggers="hover"
                   boundary="viewport">
            Check compatibility of current selection. Can take up to 30 seconds.
        </b-popover>
    </div>
</template>
<script>
  import { mapGetters } from 'vuex';
  import tempy from 'tempy';
  import { writeFile } from 'fs-extra';
  import { create } from '../../../../common/backend/interface';
  import CONFIG_NON_AL from './config.test';
  import CONFIG_AL from './config.test-al';
  export default {
    data() {
      return {
        running: false,
      };
    },
    computed: {
      ...mapGetters('dynare', {
        dynare: 'selected',
      }),
      ...mapGetters('backends', {
        executable: 'selected',
      }),
      ...mapGetters('settings', {
        cwd: 'mmbFolder',
      }),
    },
    methods: {
      async checkCompat() {
        this.running = true;
        const backend = create({
          path: this.executable.path,
          type: this.executable.type,
          ver: this.executable.ver,
          cwd: this.cwd,
        });
        const optionsNonAl = {
          ...CONFIG_NON_AL,
          dynare: this.dynare.path,
        };
        const tmpfileNonAl = tempy.file({ extension: 'json' });
        await writeFile(tmpfileNonAl, JSON.stringify(optionsNonAl, null, 2), { encoding: 'utf8' });
        const optionsAl = {
          ...CONFIG_AL,
          dynare: this.dynare.path,
        };
        const tmpfileAl = tempy.file({ extension: 'json' });
        await writeFile(tmpfileAl, JSON.stringify(optionsAl, null, 2), { encoding: 'utf8' });
        const script = `test('${tmpfileNonAl}','${tmpfileAl}');exit();`;
        try {
          let output = '';
          await backend.runCode(
            script,
            // eslint-disable-next-line no-return-assign
            data => output += data.toString(),
            err => throw err,
          );
          const [, testoutput] = output.split('---OUTPUT-START---');
          if (testoutput) {
            if (testoutput.includes('6 out of 6 successful')) {
              // eslint-disable-next-line no-alert
              alert('All tests passed. Your current selection of Dynare and MATLAB/Octave seems to be compatible.');
            } else {
              // eslint-disable-next-line no-alert
              alert('All tests ran, but at least one was unsuccessful. Simulations may produce wrong results. ' +
                'You can find information to compatible versions of Octave/Matlab and Dynare on their website or in our user guide.');
            }
          } else {
            // eslint-disable-next-line no-alert
            alert('Tests seem to have run, but no output could be captured. Simulations may produce wrong results or may not run at all. ' +
                'You can find information to compatible versions of Octave/Matlab and Dynare on their website or in our user guide.');
          }
        } catch (e) {
          // eslint-disable-next-line no-alert
          alert(`There was an error running the tests. Simulations may produce wrong results or may not run at all.
You can find information to compatible versions of Octave/Matlab and Dynare on their website or in our user guide.
Original error message: ${e.message || e.toString()}`);
        } finally {
          this.running = false;
        }
      },
    },
  };
</script>
