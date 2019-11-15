import HighCharts from 'highcharts';
import HighChartsExport from 'highcharts/modules/exporting';

HighChartsExport(HighCharts);

// Set HighCharts global options
HighCharts.setOptions({
  colors: [
    '#4572A7',
    '#AA4643',
    '#89A54E',
    '#80699B',
    '#3D96AE',
    '#DB843D',
    '#92A8CD',
    '#A47D7C',
    '#B5CA92',
  ],
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
