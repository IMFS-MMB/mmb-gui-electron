<template>
    <b-modal id="userSpecifiedRuleModal" size="lg" centered @hide="onHide">

        <h5 slot="modal-header" class="modal-title">User Specified Rule</h5>
        <button slot="modal-header" class="close" @click="hideModal"><span
                aria-hidden="true">&times;</span>
        </button>

        <table>
            <thead>
                <tr>
                    <th></th>
                    <th>interest</th>
                    <th>inflation</th>
                    <th>output</th>
                    <th>outputgap</th>
                </tr>
            </thead>
            <tbody>
            <tr>
                <th>t</th>
                <td><b-form-input type="text" disabled></b-form-input></td>
                <td><b-form-input v-model="formModel[4]" type="text" :placeholder="params[4] && params[4].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[13]" type="text" :placeholder="params[13] && params[13].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[22]" type="text" :placeholder="params[22] && params[22].description"></b-form-input></td>
            </tr>
            <tr>
                <th>t-1</th>
                <td><b-form-input v-model="formModel[0]" type="text" :placeholder="params[0] && params[0].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[5]" type="text" :placeholder="params[5] && params[5].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[14]" type="text" :placeholder="params[14] && params[14].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[23]" type="text" :placeholder="params[23] && params[23].description"></b-form-input></td>
            </tr>
            <tr>
                <th>t-2</th>
                <td><b-form-input v-model="formModel[1]" type="text" :placeholder="params[1] && params[1].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[6]" type="text" :placeholder="params[6] && params[6].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[15]" type="text" :placeholder="params[15] && params[15].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[24]" type="text" :placeholder="params[24] && params[24].description"></b-form-input></td>
            </tr>
            <tr>
                <th>t-3</th>
                <td><b-form-input v-model="formModel[2]" type="text" :placeholder="params[2] && params[2].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[7]" type="text" :placeholder="params[7] && params[7].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[16]" type="text" :placeholder="params[16] && params[16].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[25]" type="text" :placeholder="params[25] && params[25].description"></b-form-input></td>
            </tr>
            <tr>
                <th>t-4</th>
                <td><b-form-input v-model="formModel[3]" type="text" :placeholder="params[3] && params[3].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[8]" type="text" :placeholder="params[8] && params[8].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[17]" type="text" :placeholder="params[17] && params[17].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[26]" type="text" :placeholder="params[26] && params[26].description"></b-form-input></td>
            </tr>
            <tr>
                <th>t+1</th>
                <td><b-form-input type="text" disabled></b-form-input></td>
                <td><b-form-input v-model="formModel[9]" type="text" :placeholder="params[9] && params[9].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[18]" type="text" :placeholder="params[18] && params[18].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[27]" type="text" :placeholder="params[27] && params[27].description"></b-form-input></td>
            </tr>
            <tr>
                <th>t+2</th>
                <td><b-form-input type="text" disabled></b-form-input></td>
                <td><b-form-input v-model="formModel[10]" type="text" :placeholder="params[10] && params[10].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[19]" type="text" :placeholder="params[19] && params[19].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[28]" type="text" :placeholder="params[28] && params[28].description"></b-form-input></td>
            </tr>
            <tr>
                <th>t+3</th>
                <td><b-form-input type="text" disabled></b-form-input></td>
                <td><b-form-input v-model="formModel[11]" type="text" :placeholder="params[11] && params[11].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[20]" type="text" :placeholder="params[20] && params[20].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[29]" type="text" :placeholder="params[29] && params[29].description"></b-form-input></td>
            </tr>
            <tr>
                <th>t+4</th>
                <td><b-form-input type="text" disabled></b-form-input></td>
                <td><b-form-input v-model="formModel[12]" type="text" :placeholder="params[12] && params[12].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[21]" type="text" :placeholder="params[21] && params[21].description"></b-form-input></td>
                <td><b-form-input v-model="formModel[30]" type="text" :placeholder="params[30] && params[30].description"></b-form-input></td>
            </tr>
            </tbody>
        </table>
    </b-modal>
</template>
<script>
  import { mapActions, mapGetters, mapMutations } from 'vuex'; // eslint-disable-line

  export default {
    data() {
      return {
        formModel: [],
      };
    },
    created() {
      this.formModel = this.savedRule.length ? [...this.savedRule] : this.params.map(() => 0);
    },
    computed: {
      ...mapGetters('params', ['params']),
      ...mapGetters('userrule', { savedRule: 'params' }),
    },
    methods: {
      ...mapMutations('userrule', ['setParams']),
      hideModal() {
        this.$root.$emit('bv::hide::modal', 'userSpecifiedRuleModal');
      },
      onHide() {
        this.setParams(this.formModel);
      },
    },
  };
</script>
<style scoped lang="scss">

</style>