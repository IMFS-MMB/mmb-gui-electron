import HighCharts from 'highcharts';
import HighChartsExport from 'highcharts/modules/exporting';

HighChartsExport(HighCharts);

// Set HighCharts global options
HighCharts.setOptions({
  chart: {
    type: 'spline',
  },
  title: {
    text: 'Main title',
  },
  subtitle: {
    text: '',
  },
  yAxis: {
    // title: {
    //   text: 'output'
    // }

    title: false,
  },
  credits: false,
  legend: {
    // layout: 'vertical',
    // align: 'right',
    // verticalAlign: 'middle'
  },
  plotOptions: {
    series: {
      lineWidth: 3,
      marker: {
        enabled: false,
      },
    },
  },
  responsive: [
    {
      rules: [{
        condition: {
          maxWidth: 500,
        },
        chartOptions: {
          legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom',
          },
          plotOptions: {
            bullet: {
              visible: false,
            },
          },
        },
      }],
    },
  ],
});
