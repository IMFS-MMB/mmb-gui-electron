<template>
    <b-row class="mt-5">
        <b-col>
            <div id="variances-container" class="pretty-scroll">
                <table id="variances-table" class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>Variances (all quarterly)</th>
                        <th v-for="header of varTable.header">{{header}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="row of varTable.rows">
                        <th>{{row.title}}</th>
                        <td v-for="val of row.values">{{val}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </b-col>
    </b-row>
</template>
<script>
  export default {
    name: 'Variances',
    props: {
      varTable: {
        default: () => [],
      },
    },
  };
</script>
<style lang="scss">
    #variances-container {
        overflow-x: auto;
        padding-left: 0;
        margin-left: 20px;
    }

    #variances-table {
        border-spacing: 0;
        border: 0;
        border-collapse: separate;

        th:first-of-type{
            position: sticky;
            background: white;
            left: 0;
        }
    }
</style>
