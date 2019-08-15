<template>
    <b-row class="mt-5">
        <b-col>
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Variances (all quarterly)</th>
                    <th>Inflation</th>
                    <th>Interest Rate</th>
                    <th>Output</th>
                    <th>Output Gap</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="variance of varTable">
                    <th>{{variance.title}}</th>
                    <template v-if="variance.data">
                        <td>{{variance.data.inflation}}</td>
                        <td>{{variance.data.interest}}</td>
                        <td>{{variance.data.output}}</td>
                        <td>{{variance.data.outputgap}}</td>
                    </template>
                    <td v-else colspan="4"><i>Unconditional variances are unavailable for this model</i></td>
                </tr>
                </tbody>
            </table>
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
