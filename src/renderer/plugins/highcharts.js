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
    title: false,
  },
  credits: false,
  plotOptions: {
    series: {
      animation: false,
      lineWidth: 4,
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
  tooltip: {
    outside: true,
  },
});
