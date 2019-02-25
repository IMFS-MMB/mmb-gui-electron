<template>
    <b-row class="mt-5">
        <b-col>
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Variances</th>
                    <th>Inflation</th>
                    <th>Interest Rate</th>
                    <th>Output</th>
                    <th>Output Gap</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="variance of varTable">
                    <th>{{variance.title}}</th>
                    <td>{{variance.data.inflation}}</td>
                    <td>{{variance.data.interest}}</td>
                    <td>{{variance.data.output}}</td>
                    <td>{{variance.data.outputgap}}</td>
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
